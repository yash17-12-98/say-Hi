import 'package:flutter/cupertino.dart';
import 'package:flutterfire/utils/firebase_service.dart';
import 'package:get/get.dart';
import '../routes/route.dart';
import 'controller.dart';

class LoginController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void onLogin() {
    if (formKey.currentState!.validate()) {
      isLoad.value = true;
      FirebaseService.instance
          .signInUserWithEmailAndPassword(
          email: emailController.text, password: pwdController.text)
          .then((value) {
        isLoad.value = false;
        Get.toNamed(Routes.profile);
      });
    }
  }
}
