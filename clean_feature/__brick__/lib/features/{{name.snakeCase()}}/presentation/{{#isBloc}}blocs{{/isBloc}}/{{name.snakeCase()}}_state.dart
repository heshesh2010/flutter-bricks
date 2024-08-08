part of "{{name.snakeCase()}}_bloc.dart";


class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State({
    {{#addTemplateCode}}this.customProperty = "Default Value",{{/addTemplateCode}}
  });

  {{#addTemplateCode}}final String customProperty;{{/addTemplateCode}}

  @override
  List<Object> get props => [{{#addTemplateCode}}customProperty{{/addTemplateCode}}];

  {{name.pascalCase()}}State copyWith({
    {{#addTemplateCode}}String? customProperty,{{/addTemplateCode}}
  }) {
    return {{name.pascalCase()}}State(
      {{#addTemplateCode}}customProperty: customProperty ?? this.customProperty,{{/addTemplateCode}}
    );
  }
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {
  const {{name.pascalCase()}}Initial() : super();
}
