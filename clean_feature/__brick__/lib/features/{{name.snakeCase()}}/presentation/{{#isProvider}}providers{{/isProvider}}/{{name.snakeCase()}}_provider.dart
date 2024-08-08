import "package:flutter/material.dart";

{{#addTemplateCode}}import "package:dio/dio.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:data_connection_checker_tv/data_connection_checker.dart";

import "../../../../../core/connection/network_info.dart";
import "../../../../../core/errors/failure.dart";

import "../../data/models/{{name.snakeCase()}}_params.dart";
import "../../business/entities/{{name.snakeCase()}}_entity.dart";
import "../../business/use_cases/get_{{name.snakeCase()}}.dart";
{{#hasLocalData}}import "../../data/data_sources/local/{{name.snakeCase()}}_local_data_source.dart";{{/hasLocalData}}
{{#hasRemoteData}}import "../../data/data_sources/remote/{{name.snakeCase()}}_remote_data_source.dart";{{/hasRemoteData}}
import "../../data/repositories/{{name.snakeCase()}}_repository_impl.dart";{{/addTemplateCode}}

class {{name.pascalCase()}}Provider extends ChangeNotifier {
  {{#addTemplateCode}}{{name.pascalCase()}}Entity? {{name.camelCase()}};
  Failure? failure;{{/addTemplateCode}}

  {{name.pascalCase()}}Provider({
    {{#addTemplateCode}}this.{{name.camelCase()}},
    this.failure,{{/addTemplateCode}}
  });

  {{#addTemplateCode}}void eitherFailureOr{{name.pascalCase()}}() async {
    {{name.pascalCase()}}RepositoryImpl repository = {{name.pascalCase()}}RepositoryImpl(
      remoteDataSource: {{name.pascalCase()}}RemoteDataSourceImpl(
        dio: Dio(),
      ),
      localDataSource: {{name.pascalCase()}}LocalDataSourceImpl(
        localSource: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOr{{name.pascalCase()}} =
        await Get{{name.pascalCase()}}({{name.camelCase()}}Repository: repository).call(
      {{name.camelCase()}}Params: {{name.pascalCase()}}Params(),
    );

    failureOr{{name.pascalCase()}}.fold(
      (Failure newFailure) {
        {{name.camelCase()}} = null;
        failure = newFailure;
        notifyListeners();
      },
      ({{name.pascalCase()}}Entity new{{name.pascalCase()}}) {
        {{name.camelCase()}} = new{{name.pascalCase()}};
        failure = null;
        notifyListeners();
      },
    );
  }{{/addTemplateCode}}
}
