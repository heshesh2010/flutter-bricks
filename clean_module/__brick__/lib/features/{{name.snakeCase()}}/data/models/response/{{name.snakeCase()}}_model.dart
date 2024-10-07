import "dart:convert";

import "../../../domain/entities/{{name.snakeCase()}}_entity.dart";

import 'package:json_annotation/json_annotation.dart';

part '{{name.snakeCase()}}_model.g.dart';


/// Model that transforms the {{name.pascalCase()}} data from the API to the
/// application entity
  {{#areCommentsOn}}
  /*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */
  {{/areCommentsOn}}
@JsonSerializable()
class {{name.pascalCase()}}ResponseModel extends {{name.pascalCase()}}Entity {
  {{name.pascalCase()}}ResponseModel({required this.var1, required this.var2});

  factory {{name.pascalCase()}}ResponseModel.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ResponseModelFromJson(json);
  final String? var1;
  final String? var2;

  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ResponseModelToJson(this);

   /// Converts the {{name.pascalCase()}} model instance to an entity
  {{name.pascalCase()}}Entity toEntity() => const {{name.pascalCase()}}Entity();


   /// Factory method to create a {{name.pascalCase()}} model instance from an 
  /// entity
  factory {{name.pascalCase()}}Model.fromEntity({required {{name.pascalCase()}}Entity entity}) => const {{name.pascalCase()}}Model();
  
}
