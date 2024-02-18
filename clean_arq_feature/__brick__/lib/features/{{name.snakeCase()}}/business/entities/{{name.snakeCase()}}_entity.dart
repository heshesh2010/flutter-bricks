 import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}Entity extends Equatable{
  const {{name.pascalCase()}}Entity();

  {{#areCommentsOn}}/*
  An entity represents a real-world object with a distinct identity. 
  */{{/areCommentsOn}}

  @override
  List<Object> get props => [
  {{#areCommentsOn}}/*
  List your entity attributes here 
  */{{/areCommentsOn}}
  ];

  @override
  bool get stringify => true;
  
}