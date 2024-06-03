import "package:fpdart/fpdart.dart";

{{#hasRemoteData}}import "../../../../core/services/connection/network_info.dart";{{/hasRemoteData}}
import "../../../../core/errors/exceptions.dart";
import "../../../../core/errors/failure.dart";


import "../../business/repositories/{{name.snakeCase()}}_repository.dart";
{{#hasLocalData}}import "../data_sources/local/{{name.snakeCase()}}_local_data_source.dart";{{/hasLocalData}}
{{#hasRemoteData}}import "../data_sources/remote/{{name.snakeCase()}}_remote_data_source.dart";{{/hasRemoteData}}
import "../models/{{name.snakeCase()}}_model.dart";
import "../models/{{name.snakeCase()}}_params.dart";

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
{{#hasRemoteData}}final {{name.pascalCase()}}RemoteDataSource remoteDataSource;{{/hasRemoteData}}
{{#hasLocalData}}final {{name.pascalCase()}}LocalDataSource localDataSource;{{/hasLocalData}}
{{#hasRemoteData}}final NetworkInfo networkInfo;{{/hasRemoteData}}

  {{name.pascalCase()}}RepositoryImpl({
    {{#hasRemoteData}}required this.remoteDataSource,{{/hasRemoteData}}
    {{#hasLocalData}}required this.localDataSource,{{/hasLocalData}}
    {{#hasRemoteData}}required this.networkInfo,{{/hasRemoteData}}
  });

  {{#areCommentsOn}}/*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<Either<Failure, {{name.pascalCase()}}Model>> get{{name.pascalCase()}}(
      {required {{name.pascalCase()}}Params {{name.camelCase()}}Params}) async {

    {{#hasRemoteData}}if (await networkInfo.isConnected!) {
      try {
        {{name.pascalCase()}}Model remote{{name.pascalCase()}} =
            await remoteDataSource.get{{name.pascalCase()}}({{name.camelCase()}}Params: {{name.camelCase()}}Params);

        return Right(remote{{name.pascalCase()}});
      } on ServerException {
        return Left(ServerFailure(errorMessage: "This is a server exception"));
      }
    } else {
      {{#hasLocalData}}try {
        {{name.pascalCase()}}Model local{{name.pascalCase()}} = await localDataSource.getLast{{name.pascalCase()}}();
        return Right(local{{name.pascalCase()}});
      } on CacheException {
        return Left(CacheFailure(errorMessage: "This is a cache exception"));
      }{{/hasLocalData}}
    }{{/hasRemoteData}}{{^hasRemoteData}}
    {{#hasLocalData}}try {
      {{name.pascalCase()}}Model local{{name.pascalCase()}} = await localDataSource.getLast{{name.pascalCase}}();
      return Right(local{{name.pascalCase()}});
    } on CacheException {
      return Left(CacheFailure(errorMessage: "This is a cache exception"));
    }{{/hasLocalData}}{{/hasRemoteData}}
  }{{/addTemplateCode}}
}
