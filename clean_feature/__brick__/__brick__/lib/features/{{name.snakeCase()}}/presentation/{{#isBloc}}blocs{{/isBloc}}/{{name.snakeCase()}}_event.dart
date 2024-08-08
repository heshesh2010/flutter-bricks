part of "{{name.snakeCase()}}_bloc.dart";

abstract class {{name.pascalCase()}}Event  extends Equatable {
  const {{name.pascalCase()}}Event();

  @override
  List<Object> get props => [];

}

{{#addTemplateCode}}class Custom{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
  const Custom{{name.pascalCase()}}Event();
}{{/addTemplateCode}}
