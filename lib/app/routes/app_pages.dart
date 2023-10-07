// ignore_for_file: constant_identifier_names
import 'home_routes.dart';
import 'movie_page_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = '/home';
  static const DETAILS = '/details';
  static const moviePage = '/movie-page';
  static const newsPage = '/news-page';
  static final routes = [
    ...HomeRoutes.routes,
    // ...NewsViewRoutes.routes,
    // ...HomeRoutes.routes,
    ...MoviePageRoutes.routes,
  ];
}
