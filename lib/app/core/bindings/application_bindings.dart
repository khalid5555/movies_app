import 'package:get/get.dart';
import 'package:movies_app/app/modules/details/details_binding.dart';
import 'package:movies_app/app/modules/home/home_binding.dart';
import 'package:movies_app/app/modules/news_view/news_view_controller.dart';

import '../../modules/movie_page/movie_page_binding.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBinding>(() => HomeBinding());
    Get.lazyPut<DetailsBinding>(() => DetailsBinding());
    Get.lazyPut<MoviePageBinding>(() => MoviePageBinding());
    Get.lazyPut<NewsViewController>(() => NewsViewController(), fenix: true);
  }
}
