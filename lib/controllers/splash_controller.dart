import 'dart:async';
import 'package:get/get.dart';
import '../routes/route.dart';
import '../utils/util.dart';
import 'controller.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), manageAuthState);
    super.onInit();
  }

  manageAuthState() {
    switch (FirebaseService.instance.isSignedIn) {
      case true:
        return Get.offNamed(Routes.profile);
      case false:
        return Get.offNamed(Routes.login);
    }
  }
}
