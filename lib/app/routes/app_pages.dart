// ignore_for_file: constant_identifier_names

import 'home_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,
  ];
}
