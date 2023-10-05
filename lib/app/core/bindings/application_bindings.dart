import 'package:get/get.dart';
import 'package:movies_app/app/modules/details/details_binding.dart';
import 'package:movies_app/app/modules/home/home_binding.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBinding>(() => HomeBinding());
    Get.lazyPut<DetailsBinding>(() => DetailsBinding());
  }
}
