{{#addTemplateCode}}import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

import '../../data/models/{{name.snakeCase()}}_params.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';{{/addTemplateCode}}
import '../repositories/{{name.snakeCase()}}_repository.dart';

class Get{{name.pascalCase()}} {
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;

  Get{{name.pascalCase()}}({required this.{{name.camelCase()}}Repository});
   
   {{#areCommentsOn}}/*
  A use case is a list of steps to achieve a goal. It is responsible for 
  orchestrating the flow of data to and from the entities and the repository.
  */{{/areCommentsOn}}
    
  {{#addTemplateCode}}Future<Either<Failure, {{name.pascalCase()}}Entity>> call({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  }) async {
    return await {{name.camelCase()}}Repository.get{{name.pascalCase()}}({{name.camelCase()}}Params: {{name.camelCase()}}Params);
  }{{/addTemplateCode}}
  
}
