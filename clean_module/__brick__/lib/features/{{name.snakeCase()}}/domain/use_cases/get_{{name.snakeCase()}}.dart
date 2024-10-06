import "package:dartz/dartz.dart";
import "../../../../core/errors/failure.dart";
import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/{{name.camelCase()}}_params.dart";
import "../../domain/entities/{{name.camelCase()}}_entity.dart";
import "../../domain/repositories/{{name.camelCase()}}_repository.dart";

class Get{{name.pascalCase()}}UseCase implements UseCase<{{name.pascalCase()}}Entity, {{name.pascalCase()}}Params> {
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;

  Get{{name.pascalCase()}}UseCase ({required this.{{name.camelCase()}}Repository});

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> call({
     {name.pascalCase()}}Params params,
  ) {
    {{^addTemplateCode}}
    // TODO: implement call
    throw UnimplementedError();
    {{/addTemplateCode}}
    {{#addTemplateCode}}
    return {{name.camelCase()}}Repository.get{{name.pascalCase()}}({{name.camelCase()}}Params: params);
    {{/addTemplateCode}}
  }
}
