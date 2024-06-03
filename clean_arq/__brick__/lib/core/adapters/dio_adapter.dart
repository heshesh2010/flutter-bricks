import "dart:async";

import "package:dio/dio.dart";
import "package:dio/io.dart";
import "package:flutter/foundation.dart";
import "package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart";

import "../../features/auth/business/entities/token_entity.dart";
import "../errors/connection/client_error_exception.dart";
import "../errors/connection/connection_error_exception.dart";
import "../errors/connection/server_error_exception.dart";
import "../extensions/num_extension.dart";
import "../services/logger/http_log.dart";

/// Adapter for the Dio client
///
/// This adapter is used to create a Dio client with the necessary
/// configurations for the application. It also includes the necessary
/// error handling for the application.
class DioAdapter extends DioForNative {
  /// Adapter for the Dio client
  ///
  /// This adapter is used to create a Dio client with the necessary
  /// configurations for the application. It also includes the necessary
  /// error handling for the application.
  DioAdapter({
    this.receiveTimeout,
    this.connectTimeout,
    this.sendTimeout,
  }) {
    _initializeAdapter();
  }

  /// The timeout for the receive operation
  final Duration? receiveTimeout;

  /// The timeout for the connect operation
  final Duration? connectTimeout;

  /// The timeout for the send operation
  final Duration? sendTimeout;

  void _initializeAdapter() {
    options = BaseOptions(
      sendTimeout: sendTimeout,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json,
    );

    interceptors
      ..add(
        PrettyDioLogger(
          requestHeader: false,
          queryParameters: false,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          showProcessingTime: false,
          showCUrl: false,
          canShowLog: kDebugMode,
        ),
      )
      ..add(
        InterceptorsWrapper(
          onRequest: onRequestMethod,
          onResponse: onResponseMethod,
          onError: onErrorMethod,
        ),
      );
  }

  /// Handles the request prior to being sent
  FutureOr<void> onRequestMethod(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  /// Handles the response prior to being returned
  FutureOr<void> onResponseMethod(
    Response response,
    ResponseInterceptorHandler handler,
  ) async =>
      handler.next(response);

  /// Handles the error prior to being thrown
  FutureOr<void> onErrorMethod(
    DioException error,
    ErrorInterceptorHandler _,
  ) {
    sentryHttpBreadCrumb(
      log: HttpLog(
        method: error.requestOptions.method,
        path: error.requestOptions.path,
        queries: error.requestOptions.queryParameters,
        error: error.type.name,
        // body: body,
      ),
    );
    switch (error.type) {
      case DioExceptionType.connectionError:
        throw ConnectionErrorException.serverDown();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw ConnectionErrorException.clientOffline();

      case DioExceptionType.badResponse:
        final statusCode = error.response!.statusCode!;

        if (statusCode.isBetween(300, 499)) {
          if (statusCode.isBetween(401, 403)) {
            throw ClientErrorException.unauthorized(
              data: error.response?.data,
            );
          }

          if (error.response!.data["Message"] != null) {
            throw ClientErrorException.badRequest(
              data: error.response?.data,
              message: (error.response!.data["Message"] as String).trim(),
            );
          }

          throw ClientErrorException.badRequest(
            data: error.response?.data,
          );
        } else if (statusCode.isBetween(500, 599)) {
          throw ServerErrorException(
            title: "Error del servidor",
            data: error.response?.data,
          );
        }
        throw ClientErrorException.badRequest();
      case DioExceptionType.cancel:
        throw ClientErrorException.cancelRequest();
      case DioExceptionType.badCertificate:
        throw ServerErrorException.badCertificate();
      case DioExceptionType.unknown:
        throw ConnectionErrorException.clientOffline(
          message: "El dispositivo no tiene acceso a internet",
        );
    }
  }
}
