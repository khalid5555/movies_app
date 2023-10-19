import 'package:get/get.dart';
import 'package:movies_app/app/modules/movie_page/movie_details_page.dart';
import 'package:movies_app/app/modules/movie_page/movies_view.dart';
import 'package:movies_app/app/modules/news_view/news_view_page.dart';
import 'package:movies_app/app/modules/weather_page/weather_page.dart';

import '../core/bindings/application_bindings.dart';
import '../modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();
  static const home = '/home';
  static const weatherPage = '/weatherPage';
  static const moviePage = '/movie-page';
  static const newsPage = '/news-page';
  // static const moviePage = '/movie-page';
  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: ApplicationBindings(),
    ),
    GetPage(
      name: moviePage,
      page: () => const MoviesView(),
      binding: ApplicationBindings(),
    ),
    GetPage(
      name: newsPage,
      page: () => NewsViewPage(),
      binding: ApplicationBindings(),
    ),
    GetPage(
      name: moviePage,
      page: () => const MoviePage(),
      binding: ApplicationBindings(),
    ),
    GetPage(
        name: weatherPage,
        page: () => const WeatherPage(),
        binding: ApplicationBindings(),
        transition: Transition.size,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
