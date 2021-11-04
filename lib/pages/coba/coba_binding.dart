import 'package:get/get.dart';

import 'coba_controller.dart';

class CobaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CobaController>(() => CobaController());
  }
}
