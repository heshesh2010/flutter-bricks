import "package:clean_playground/core/errors/failure.dart";
import "package:fpdart/fpdart.dart";

import "../../../../core/constants/classes/use_case.dart";
import "../../data/models/dtos/{{name.camelCase()}}_model.dart";
import "../../data/models/params/{{name.camelCase()}}_params.dart";
import "../repositories/{{name.camelCase()}}_repository.dart";

class Get{{name.pascalCase()}} implements UseCase<{{name.pascalCase()}}Model, {{name.pascalCase()}}Params> {
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;

  GetHome({required this.{{name.camelCase()}}Repository});

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call({
    required {{name.pascalCase()}}Params params,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
