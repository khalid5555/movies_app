import 'package:NewsMovie/app/core/bindings/application_bindings.dart';
import 'package:NewsMovie/app/core/shared/utils/app_theme.dart';
import 'package:NewsMovie/app/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.SPLASH,
      getPages: HomeRoutes.routes,
      // home: const WeatherPageTest(),
      title: 'movies',
      theme: AppTheme.themeLight,
    );
  }
}
// Your API key is: f278013c42cb402f8ba30770a2cc67cf
// Your API key to themoviedb.org is: 805d482bbe9f774e4c8231aeb0c303a2
// www.weatherapi.comAPI Key: 079a0aa530ec40e9ad7221101231710 
//lIVETRIAL Ends on 31/Oct/2023
