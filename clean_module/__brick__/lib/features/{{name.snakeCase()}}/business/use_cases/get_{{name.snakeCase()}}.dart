import "package:clean_playground/core/errors/failure.dart";
import "package:dartz/dartz.dart";

import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/params/{{name.camelCase()}}_params.dart";
import "../entities/{{name.camelCase()}}_entity.dart";
import "../repositories/{{name.camelCase()}}_repository.dart";

class Get{{name.pascalCase()}} implements UseCase<{{name.pascalCase()}}Entity, {{name.pascalCase()}}Params> {
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;

  GetHome({required this.{{name.camelCase()}}Repository});

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> call({
    required {{name.pascalCase()}}Params params,
  }) {
    {{^addTemplateCode}}
    // TODO: implement call
    throw UnimplementedError();
    {{/addTemplateCode}}
    {{#addTemplateCode}}
    return {{name.camelCase()}}Repository.get{{name.pascalCase()}}({{name.camelCase()}}Params: params);
    {{/addTemplateCode}}
  }
}
