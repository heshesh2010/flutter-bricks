 import "package:equatable/equatable.dart";

/// Entity that contains the data of the {{name.pascalCase()}}.
class {{name.pascalCase()}}Entity extends Equatable{
  /// Entity that contains the data of the {{name.pascalCase()}}.
  const {{name.pascalCase()}}Entity();

  {{#areCommentsOn}}/*
  An entity represents a real-world object with a distinct identity. 
  */{{/areCommentsOn}}

  @override
  List<Object?> get props => [
  {{#areCommentsOn}}/*
  List your entity attributes here 
  */{{/areCommentsOn}}
  ];

  @override
  bool get stringify => true;
}