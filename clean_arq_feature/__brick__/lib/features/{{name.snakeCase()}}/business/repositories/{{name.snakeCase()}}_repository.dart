{{#addTemplateCode}}import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

import '../../data/models/{{name.snakeCase()}}_params.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';{{/addTemplateCode}}

abstract class {{name.pascalCase()}}Repository {

  {{#areCommentsOn}}/*
  A repository is a collection of data operations. It is responsible for 
  abstracting the data layer from the business logic layer. 
  */{{/areCommentsOn}}

  {{#addTemplateCode}}Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  });{{/addTemplateCode}}
}
