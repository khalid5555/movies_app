import 'package:NewsMovie/app/modules/home/splash_page.dart';
import 'package:NewsMovie/app/modules/movie_page/movie_details_page.dart';
import 'package:NewsMovie/app/modules/movie_page/movies_view.dart';
import 'package:NewsMovie/app/modules/news_view/news_view_page.dart';
import 'package:NewsMovie/app/modules/weather_page/weather_page%20copy.dart';
import 'package:get/get.dart';

import '../core/bindings/application_bindings.dart';
import '../modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();
  static const home = '/home';
  static const splash = '/splash';
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
      name: splash,
      page: () => const SplashPage(),
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
        page: () => const WeatherPageTest(),
        binding: ApplicationBindings(),
        transition: Transition.size,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
