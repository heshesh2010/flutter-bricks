import "package:flutter/material.dart";
import "package:flutter_flavor/flutter_flavor.dart";

import "core/constants/theme/material_theme.dart";
import "core/constants/theme/util.dart";
import "core/routes/app_router.dart";


class {{name.pascalCase()}}App extends StatelessWidget {
  {{name.pascalCase()}}App({super.key});

  final appRouter = AppRouter();    

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp.router(
        title: "{{name.pascalCase()}}",
        debugShowCheckedModeBanner: false,

        //Theming  
        themeMode: ThemeMode.system,
            theme: MaterialTheme(createTextTheme(context, "Poppins", "Poppins"),)
                .light(),
            darkTheme:
                MaterialTheme(createTextTheme(context, "Poppins", "Poppins"),)
                    .dark(),


        routerConfig: appRouter.config(),
      ),
    );
  }
}