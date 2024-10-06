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
class {{name.pascalCase()}}RequestModel extends {{name.pascalCase()}}Entity {
  {{name.pascalCase()}}RequestModel({required this.var1, required this.var1});

  factory {{name.pascalCase()}}RequestModel.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}RequestModelFromJson(json);
  final String? var1;
  final String? var2;

  Map<String, dynamic> toJson() => _$H{{name.pascalCase()}}RequestModelToJson(this);
}
