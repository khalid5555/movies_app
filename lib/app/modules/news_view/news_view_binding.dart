import 'package:get/get.dart';

import 'news_view_controller.dart';

class NewsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsViewController>(
      () => NewsViewController(),
    );
  }
}
