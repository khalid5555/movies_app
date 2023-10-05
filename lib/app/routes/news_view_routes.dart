import 'package:get/get.dart';

import '../modules/news_view/news_view_binding.dart';
import '../modules/news_view/news_view_page.dart';

class NewsViewRoutes {
  NewsViewRoutes._();

  static const newsView = '/news-view';

  static final routes = [
    GetPage(
      name: newsView,
      page: () => const NewsViewPage(),
      binding: NewsViewBinding(),
    ),
  ];
}
