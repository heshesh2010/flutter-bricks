import "package:flutter_bloc/flutter_bloc.dart";
{{#hasLocalData}}{{#addTemplateCode}}import "package:shared_preferences/shared_preferences.dart";{{/addTemplateCode}}{{/hasLocalData}}

import "../../../../core/cubit_states/state_mixin.dart";
import "../../business/entities/{{name.snakeCase()}}_entity.dart";

{{#addTemplateCode}}{{#hasRemoteData}}import "../../../../core/adapters/dio_adapter.dart";
import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";{{/hasRemoteData}}

import "../../../../core/errors/failure.dart";
{{#hasRemoteData}}import "../../../../core/services/connection/network_info.dart";{{/hasRemoteData}}

import "../../data/repositories/{{name.snakeCase()}}_repository_impl.dart";
import "../../business/use_cases/get_{{name.snakeCase()}}.dart";
import "../../data/models/params/{{name.snakeCase()}}_params.dart";
{{#hasLocalData}}import "../../data/data_sources/local/{{name.snakeCase()}}_local_data_source.dart";{{/hasLocalData}}
{{#hasRemoteData}}import "../../data/data_sources/remote/{{name.snakeCase()}}_remote_data_source.dart";{{/hasRemoteData}}{{/addTemplateCode}}

class {{name.pascalCase()}}Cubit extends Cubit<StateMixin<{{name.pascalCase()}}Entity>> {
  
  {{name.pascalCase()}}Cubit() : super(StateMixin<{{name.pascalCase()}}Entity>.loading());

  {{#addTemplateCode}}void eitherFailureOr{{name.pascalCase()}}() async {
    {{name.pascalCase()}}RepositoryImpl repository = {{name.pascalCase()}}RepositoryImpl(
      {{#hasRemoteData}}remoteDataSource: {{name.pascalCase()}}RemoteDataSourceImpl(
        dio: DioAdapter(
          internetInfo: NetworkInfoImpl(
            InternetConnection(),
          ),
        ),
      ),{{/hasRemoteData}}
      {{#hasLocalData}}localDataSource: {{name.pascalCase()}}LocalDataSourceImpl(
        localSource: await SharedPreferences.getInstance(),
      ),{{/hasLocalData}}
      {{#hasRemoteData}}networkInfo: NetworkInfoImpl(
        InternetConnection(),
      ),{{/hasRemoteData}}
    );

    final failureOr{{name.pascalCase()}} =
        await Get{{name.pascalCase()}}({{name.camelCase()}}Repository: repository).call(
      params: {{name.pascalCase()}}Params(),
    );

    failureOr{{name.pascalCase()}}.fold(
      (Failure newFailure) {
        emit(StateMixin.failure(newFailure));
      },
      ({{name.pascalCase()}}Entity new{{name.pascalCase()}}) {
        emit(StateMixin.success(new{{name.pascalCase()}}));
      },
    );
  }{{/addTemplateCode}}
}
