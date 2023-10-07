import 'package:get/get.dart';
import 'package:movies_app/app/modules/details/details_binding.dart';
import 'package:movies_app/app/modules/details/details_page.dart';
import 'package:movies_app/app/modules/movie_page/movies_view.dart';
import 'package:movies_app/app/modules/news_view/news_view_page.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();
  static const home = '/home';
  static const details = '/details';
  static const moviePage = '/movie-page';
  static const newsPage = '/news-page';
  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: moviePage,
      page: () => const MoviesView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: newsPage,
      page: () => NewsViewPage(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: details,
        page: () => const DetailsPage(),
        binding: DetailsBinding(),
        transition: Transition.size,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
