import "package:riverpod/riverpod.dart";

final {{name.camelCase()}}Provider = StateNotifierProvider.autoDispose((ref) {
  return {{name.pascalCase()}}();
});

class {{name.pascalCase()}} extends StateNotifier<int> {
  {{name.pascalCase()}}() : super(0);

  
}
