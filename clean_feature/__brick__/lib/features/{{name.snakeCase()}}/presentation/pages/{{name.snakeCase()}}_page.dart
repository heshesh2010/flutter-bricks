import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

{{#isGetx}}import "package:get/get.dart";{{/isGetx}}{{#isRiverpod}}import "package:flutter_riverpod/flutter_riverpod.dart";{{/isRiverpod}}{{#isProvider}}import "package:provider/provider.dart";{{/isProvider}}{{#isCubit}}import "package:flutter_bloc/flutter_bloc.dart";{{/isCubit}}{{#isBloc}}import "package:flutter_bloc/flutter_bloc.dart";{{/isBloc}}

{{#isGetx}}import "../getX/{{name.snakeCase()}}_controller.dart";{{/isGetx}}{{#isProvider}}import "../providers/{{name.snakeCase()}}_provider.dart";{{/isProvider}}{{#isRiverpod}}import "../providers/{{name.snakeCase()}}_provider.dart";{{/isRiverpod}}{{#isCubit}}import "../cubits/{{name.snakeCase()}}_cubit.dart";{{/isCubit}}{{#isBloc}}import "../blocs/{{name.snakeCase()}}_bloc.dart";{{/isBloc}}

@RoutePage()
class {{name.pascalCase()}}Page extends {{#isGetx}}GetView<{{name.pascalCase()}}Controller>{{/isGetx}}{{#isRiverpod}}ConsumerWidget{{/isRiverpod}}{{#isProvider}}StatelessWidget{{/isProvider}}{{#isCubit}}StatelessWidget{{/isCubit}}{{#isBloc}}StatelessWidget{{/isBloc}}
{
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context{{#isRiverpod}}, WidgetRef ref {{/isRiverpod}}) {
    {{#isRiverpod}}final state = ref.watch({{name.camelCase()}}Provider);{{/isRiverpod}}
    {{#isProvider}}return Scaffold(
      body: Provider(
        create: (context) => {{name.pascalCase()}}Provider(),
        child: const Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );{{/isProvider}}{{#isCubit}}return Scaffold(
      body: BlocProvider(
        create: (context) => {{name.pascalCase()}}Cubit(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );{{/isCubit}}{{#isBloc}}return Scaffold(
      body: BlocProvider(
        create: (context) => {{name.pascalCase()}}Bloc(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );{{/isBloc}}{{#isGetx}}return Scaffold(
      body: Center(
        child: Text("Created with clean arq brick"),
      ),
    );{{/isGetx}}{{#isRiverpod}}return Scaffold(
      body: Center(
        child: Text("Created with clean arq brick"),
      ),
    );{{/isRiverpod}}
  }
}
