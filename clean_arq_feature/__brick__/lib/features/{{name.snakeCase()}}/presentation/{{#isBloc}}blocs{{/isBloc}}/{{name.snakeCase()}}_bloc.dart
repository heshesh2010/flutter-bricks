import "dart:async";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
part "{{name.snakeCase()}}_event.dart";
part "{{name.snakeCase()}}_state.dart";

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super(const {{name.pascalCase()}}Initial()) {
    {{#addTemplateCode}}on<Custom{{name.pascalCase()}}Event>(_onCustom{{name.pascalCase()}}Event);{{/addTemplateCode}}
  }

  {{#addTemplateCode}}FutureOr<void> _onCustom{{name.pascalCase()}}Event(
    Custom{{name.pascalCase()}}Event event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) {
    // TODO: Add Logic
  }{{/addTemplateCode}}
}
