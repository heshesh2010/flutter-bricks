{{#addTemplateCode}}import "package:fpdart/fpdart.dart";{{/addTemplateCode}}

{{#hasRemoteData}}import "../../../../core/services/connection/network_info.dart";{{/hasRemoteData}}
{{#addTemplateCode}}import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";{{/addTemplateCode}}


import "../../business/repositories/{{name.snakeCase()}}_repository.dart";
{{#hasLocalData}}import "../data_sources/local/{{name.snakeCase()}}_local_data_source.dart";{{/hasLocalData}}
{{#hasRemoteData}}import "../data_sources/remote/{{name.snakeCase()}}_remote_data_source.dart";{{/hasRemoteData}}
{{#addTemplateCode}}import "../models/{{name.snakeCase()}}_model.dart";
import "../models/{{name.snakeCase()}}_params.dart";{{/addTemplateCode}}

/// Data operations for the {{name.pascalCase()}} collection
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  /// Data operations for the {{name.pascalCase()}} collection
  {{name.pascalCase()}}RepositoryImpl({
    {{#hasRemoteData}}required this.remoteDataSource,{{/hasRemoteData}}
    {{#hasLocalData}}required this.localDataSource,{{/hasLocalData}}
    {{#hasRemoteData}}required this.networkInfo,{{/hasRemoteData}}
  });
  
{{#hasRemoteData}}final {{name.pascalCase()}}RemoteDataSource remoteDataSource;{{/hasRemoteData}}
{{#hasLocalData}}final {{name.pascalCase()}}LocalDataSource localDataSource;{{/hasLocalData}}
{{#hasRemoteData}}final NetworkInfo networkInfo;{{/hasRemoteData}}

  

  {{#areCommentsOn}}/*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}(
      {required {{name.pascalCase()}}Params {{name.camelCase()}}Params}) async {

    {{#hasRemoteData}}if (await networkInfo.isConnected) {
      return ErrorHandler.handleApiCall<{{name.pascalCase()}}Model>(
        () {
          return remoteDataSource.get{{name.pascalCase()}}({{name.camelCase()}}Params: {{name.camelCase()}}Params);
        },
      );
    } else {
      {{#hasLocalData}}return ErrorHandler.handleCacheCall<{{name.pascalCase()}}Model>(
        () {
          return localDataSource.getLast{{name.pascalCase()}}();
        },
      );{{/hasLocalData}}
    }{{/hasRemoteData}}{{^hasRemoteData}}
    {{#hasLocalData}}return ErrorHandler.handleCacheCall<{{name.pascalCase()}}Model>(
        () {
          return localDataSource.getLast{{name.pascalCase()}}();
        },
      );{{/hasLocalData}}{{/hasRemoteData}}
  }{{/addTemplateCode}}
}
