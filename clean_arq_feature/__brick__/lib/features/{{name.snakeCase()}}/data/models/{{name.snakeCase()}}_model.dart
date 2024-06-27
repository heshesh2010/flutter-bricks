import "../../business/entities/{{name.snakeCase()}}_entity.dart";

/// Model that transforms the {{name.pascalCase()}} data from the API to the
/// application entity
class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  /// Model that transforms the {{name.pascalCase()}} data from the API to the
  /// application entity
  const {{name.pascalCase()}}Model();

  {{#areCommentsOn}}/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  /// Factory method to create a {{name.pascalCase()}} model instance from a map
  {{#addTemplateCode}}factory {{name.pascalCase()}}Model.fromMap({required Map<String, dynamic> json}) =>
     {{name.pascalCase()}}Model();

  /// Factory method to create a {{name.pascalCase()}} model instance from an 
  /// entity
  {{name.pascalCase()}}Model.fromEntity({required {{name.pascalCase()}}Entity entity}) => ProjectModel();

  /// Converts the {{name.pascalCase()}} model instance to a map
  Map<String, dynamic> toMap() {
    return {};
  }{{/addTemplateCode}}
  
  /// Converts the {{name.pascalCase()}} model instance to an entity
  {{name.pascalCase()}}Entity toEntity() =>
    return {{name.pascalCase()}}Entity();
}
