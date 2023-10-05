import 'package:get/get.dart';
import 'package:movies_app/app/modules/details/details_controller.dart';
class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
