import 'package:get/get.dart';

import '../modules/movie_page/movie_page_binding.dart';
import '../modules/movie_page/movie_page.dart';

class MoviePageRoutes {
  MoviePageRoutes._();

  static const moviePage = '/movie-page';

  static final routes = [
    GetPage(
      name: moviePage,
      page: () =>  MoviePage(),
      binding: MoviePageBinding(),
    ),
  ];
}
