import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/app/core/bindings/application_bindings.dart';
import 'package:movies_app/app/core/shared/utils/app_theme.dart';
import 'package:movies_app/app/routes/app_pages.dart';
import 'package:movies_app/app/routes/home_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: HomeRoutes.routes,
      // home: const MoviesPage(),
      title: 'movies',
      theme: AppTheme.themeLight,
    );
  }
}
// Your API key is: f278013c42cb402f8ba30770a2cc67cf
// Your API key to themoviedb.org is: 805d482bbe9f774e4c8231aeb0c303a2
