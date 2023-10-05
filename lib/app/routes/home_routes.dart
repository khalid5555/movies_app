import 'package:get/get.dart';
import 'package:movies_app/app/modules/details/details_binding.dart';
import 'package:movies_app/app/modules/details/details_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
class HomeRoutes {
  HomeRoutes._();
  static const home = '/home';
  static const details = '/details';
  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
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
