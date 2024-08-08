import "package:flutter/material.dart";
import "package:flutter_flavor/flutter_flavor.dart";

import "core/config/dependency_injection.dart";
import "{{name.snakeCase()}}_app.dart";

void main() async {
  FlavorConfig(
    name: "",
    color: Colors.blue,
    location: BannerLocation.topStart,
    variables: {
      "key": "value",
    },
  );

  await DependencyInjection.init();

  runApp({{name.pascalCase()}}App());
}
