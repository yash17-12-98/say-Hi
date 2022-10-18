import 'package:get/get.dart';

import '../controllers/controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => (SignupController()));
  }
}
