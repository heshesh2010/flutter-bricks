/// Parameters used to make the {{name.pascalCase()}} request.
class {{name.pascalCase()}}Params {
  /// Parameters used to make the {{name.pascalCase()}} request.
  const {{name.pascalCase()}}Params();
  
  {{#areCommentsOn}}/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */{{/areCommentsOn}}
}