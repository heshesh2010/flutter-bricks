import "package:flutter/material.dart";

{{#addTemplateCode}}import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../../../../core/errors/failure.dart";
import "../../../../core/adapters/dio_adapter.dart";
import "../../../../core/services/connection/network_info.dart";

import "../../data/models/request/{{name.snakeCase()}}_params.dart";
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
        dio: DioAdapter(
          internetInfo: NetworkInfoImpl(
            InternetConnection(),
          ),
        ),
      ),
      localDataSource: {{name.pascalCase()}}LocalDataSourceImpl(
        localSource: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        InternetConnection(),
      ),
    );

    final failureOr{const {name.pascalCase()}} =
        await Get{{name.pascalCase()}}({{name.camelCase()}}Repository: repository).call(
      params: {{name.pascalCase()}}Params(),
    );

    failureOr{{name.pascalCase()}}.fold(
      (Failure newFailure) {
        {const {name.camelCase()}} = null;
        failure = newFailure;
        notifyListeners();
      },
      ({{name.pascalCase()}}Entity new{{name.pascalCase()}}) {
        {const const {name.camelCase()}} = {name.pascalCase()}};
        failure = null;
        notifyListeners();
      },
    );
  }{{/addTemplateCode}}
}
