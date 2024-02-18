import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'core/constants/colors.dart';
import 'core/routes/app_router.dart';


class {{name.pascalCase()}}App extends StatelessWidget {
  {{name.pascalCase()}}App({super.key});

  final appRouter = AppRouter();    

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp.router(
        title: '{{name.pascalCase()}}',
        debugShowCheckedModeBanner: false,

        //Theming  
        theme: AppColors.brightTheme,
        darkTheme: AppColors.darkTheme,
        themeMode: ThemeMode.system,


        routerConfig: appRouter.config(),
      ),
    );
  }
}