import 'package:get/get.dart';

import 'movie_page_controller.dart';

class MoviePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviePageController>(
      () => MoviePageController(),
    );
  }
}
