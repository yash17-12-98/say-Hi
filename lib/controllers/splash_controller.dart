import 'dart:async';
import 'package:get/get.dart';
import '../routes/route.dart';
import '../utils/util.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), manageAuthState);
    super.onInit();
  }

  manageAuthState() {
    switch (FirebaseServices.instance.isSignedIn) {
      case true:
        return Get.offNamed(Routes.home);
      case false:
        return Get.offNamed(Routes.login);
    }
  }
}
