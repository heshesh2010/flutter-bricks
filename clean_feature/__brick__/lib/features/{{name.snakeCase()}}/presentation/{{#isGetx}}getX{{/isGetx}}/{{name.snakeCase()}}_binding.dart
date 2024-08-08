
  import "package:get/get.dart"; 
  import "{{name.snakeCase()}}_controller.dart";

  class {{name.pascalCase()}}Binding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => {{name.pascalCase()}}Controller());
  }
  