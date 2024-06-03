import "../../business/entities/{{name.snakeCase()}}_entity.dart";

class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  const {{name.pascalCase()}}Model();

  {{#areCommentsOn}}/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}factory {{name.pascalCase()}}Model.fromJson({required Map<String, dynamic> json}) =>
     {{name.pascalCase()}}Model();

  Map<String, dynamic> toJson() {
    return {};
  }{{/addTemplateCode}}
  
}
