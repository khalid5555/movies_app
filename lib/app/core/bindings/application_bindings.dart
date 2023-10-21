import 'package:get/get.dart';
import 'package:NewsMovie/app/modules/news_view/news_view_controller.dart';
import 'package:NewsMovie/app/modules/weather_page/weather_controller.dart';

import '../../modules/home/home_controller.dart';
import '../../modules/movie_page/movie_page_controller.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<WeatherController>(() => WeatherController(), fenix: true);
    Get.lazyPut<MoviePageController>(() => MoviePageController(), fenix: true);
    Get.lazyPut<NewsController>(() => NewsController(), fenix: true);
  }
}
