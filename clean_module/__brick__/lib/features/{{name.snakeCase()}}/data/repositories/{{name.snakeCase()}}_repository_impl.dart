{{#addTemplateCode}}import "package:dartz/dartz.dart";{{/addTemplateCode}}

{{#hasRemoteData}}{{#hasLocalData}}import "../../../../core/services/network_info.dart";{{/hasLocalData}}{{/hasRemoteData}}
{{#addTemplateCode}}import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";{{/addTemplateCode}}
import "package:injectable/injectable.dart";


import "../../domain/repositories/{{name.snakeCase()}}_repository.dart";
{{#hasLocalData}}import "../data_sources/local/{{name.snakeCase()}}_local_data_source.dart";{{/hasLocalData}}
{{#hasRemoteData}}import "../data_sources/remote/{{name.snakeCase()}}_remote_data_source.dart";{{/hasRemoteData}}
{{#addTemplateCode}}import "../models/response/{{name.snakeCase()}}_model.dart";
import "../models/request/{{name.snakeCase()}}_params.dart";{{/addTemplateCode}}

/// Data operations for the {{name.pascalCase()}} collection
@Injectable(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  /// Data operations for the {{name.pascalCase()}} collection
  {{name.pascalCase()}}RepositoryImpl({
    {{#hasRemoteData}}required this.remoteDataSource,{{/hasRemoteData}}
    {{#hasLocalData}}required this.localDataSource,{{/hasLocalData}}
    {{#hasRemoteData}}{{#hasLocalData}}required this.networkInfo,{{/hasLocalData}}{{/hasRemoteData}}
  });
  
{{#hasRemoteData}}final {{name.pascalCase()}}RemoteDataSource remoteDataSource;{{/hasRemoteData}}
{{#hasLocalData}}final {{name.pascalCase()}}LocalDataSource localDataSource;{{/hasLocalData}}
{{#hasRemoteData}}{{#hasLocalData}}final NetworkInfo networkInfo;{{/hasLocalData}}{{/hasRemoteData}}

  {{#areCommentsOn}}/*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<Either<Failure, {{name.pascalCase()}}ResponseModel>> get{{name.pascalCase()}}(
      {required {{name.pascalCase()}}Params {{name.camelCase()}}Params}) async {

    {{#hasRemoteData}}if (await networkInfo.isConnected) {
      return ErrorHandler.handleApiCall<{{name.pascalCase()}}ResponseModel>(
        () {
          return remoteDataSource.get{{name.pascalCase()}}({{name.camelCase()}}Params: {{name.camelCase()}}Params);
        },
      );
    } else {
      {{#hasLocalData}}return ErrorHandler.handleCacheCall<{{name.pascalCase()}}ResponseModel>(
        () {
          return localDataSource.getLast{{name.pascalCase()}}();
        },
      );{{/hasLocalData}}
    }{{/hasRemoteData}}{{^hasRemoteData}}
    {{#hasLocalData}}return ErrorHandler.handleCacheCall<{{name.pascalCase()}}ResponseModel>(
        () {
          return localDataSource.getLast{{name.pascalCase()}}();
        },
      );{{/hasLocalData}}{{/hasRemoteData}}
  }{{/addTemplateCode}}
}
