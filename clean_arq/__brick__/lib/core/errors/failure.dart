import "../../gen/assets.gen.dart";
import "app_exception.dart";
import "connection/http_call_exception.dart";

/// The abstract class for the failures in the application
abstract class Failure {
  /// The abstract class for the failures in the application
  Failure({
    required this.animationPath,
    required this.message,
    required this.title,
    required this.level,
  });

  /// The path of the image that will be shown in the error page
  final String animationPath;

  /// The message of the error
  final String message;

  /// The title of the error
  final String title;

  /// The level of the error
  final FailureLevel level;
}

/// The levels of the failures
enum FailureLevel {
  /// Crtical error
  error,

  /// Warning error
  warning,

  /// Information error
  info,
}

/// Failure for the Http calls
class HttpCallFailure extends Failure {
  /// Failure for the Http calls
  HttpCallFailure({
    required super.animationPath,
    required super.message,
    required super.title,
    required super.level,
  });

  /// Create a [HttpCallFailure] from a [HttpCallException]
  factory HttpCallFailure.fromException(HttpCallException exception) =>
      HttpCallFailure(
        title: exception.title,
        message: exception.message,
        animationPath: _getImagePath(exception.type),
        level: _getLevel(exception.type),
      );

  static FailureLevel _getLevel(HttpExceptions type) {
    switch (type) {
      case HttpExceptions.connectionError:
      case HttpExceptions.clientOffline:
        return FailureLevel.warning;
      case HttpExceptions.serverDown:
      case HttpExceptions.serverError:
        return FailureLevel.error;
      case HttpExceptions.unauthorized:
      case HttpExceptions.expiredToken:
        return FailureLevel.warning;
      case HttpExceptions.clientError:
      case HttpExceptions.badRequest:
        return FailureLevel.warning;
      case HttpExceptions.cancelRequest:
      case HttpExceptions.other:
      case HttpExceptions.badCertificate:
        return FailureLevel.info;
      default:
        return FailureLevel.error;
    }
  }

  // TODO: Add animations for the different types of errors
  // You can download the animations from https://lottiefiles.com/
  static String _getImagePath(HttpExceptions type) {
    switch (type) {
      case HttpExceptions.connectionError:
      case HttpExceptions.clientOffline:
        return Assets.animations.internet.noInternet;
      case HttpExceptions.serverDown:
      case HttpExceptions.serverError:
        return Assets.animations.internet.serverError;
      case HttpExceptions.unauthorized:
      case HttpExceptions.expiredToken:
        return Assets.animations.internet.unauthorized;
      case HttpExceptions.clientError:
      case HttpExceptions.badRequest:
        return Assets.animations.internet.badRequest;
      case HttpExceptions.cancelRequest:
        return Assets.animations.internet.canceled;
      case HttpExceptions.badCertificate:
        return Assets.animations.internet.badCertificate;
      case HttpExceptions.other:
        return Assets.animations.internet.unexpected;
      default:
        return Assets.animations.internet.unexpected;
    }
  }
}

/// Failure used for the application side
class AppFailure extends Failure {
  /// Failure used for the application side
  AppFailure({
    required super.animationPath,
    required super.message,
    required super.title,
    super.level = FailureLevel.error,
  });

  /// Create an [AppFailure]
  ///
  /// [message] is the message of the error
  ///
  /// This is used when the error is unexpected
  factory AppFailure.unexpected(String message) => AppFailure(
        title: "Ocurrió un error en la aplicación",
        message: message,
        animationPath: Assets.animations.appError,
      );

  /// Create an [AppFailure]
  ///
  /// [errorMessage] is the message of the error
  ///
  /// This is used when the error is related to the environment
  factory AppFailure.environment({
    required String errorMessage,
  }) =>
      AppFailure(
        title: "Ocurrió un error en la aplicación",
        message: errorMessage,
        animationPath: Assets.animations.appError,
      );

  /// Create an [AppFailure]
  ///
  /// [exception] is the exception that was thrown
  ///
  /// This is used when the error is related to cache operations
  factory AppFailure.cacheException(CacheException exception) => AppFailure(
        title: exception.title,
        message: exception.message,
        animationPath: Assets.animations.internet.unexpected,
        level: FailureLevel.error,
      );
}
