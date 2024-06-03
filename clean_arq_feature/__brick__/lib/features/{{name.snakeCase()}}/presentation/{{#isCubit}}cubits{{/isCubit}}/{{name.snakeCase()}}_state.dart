part of "{{name.snakeCase()}}_cubit.dart";

class {{name.pascalCase()}}State extends Equatable {
  
  const {{name.pascalCase()}}State();
  
  @override
  List<Object> get props => [];
 
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {
  const {{name.pascalCase()}}Initial() : super();
}

{{#addTemplateCode}}// TODO: Delete this class {{/addTemplateCode}}
