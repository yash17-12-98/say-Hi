import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../routes/route.dart';
import '../utils/util.dart';
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

  void signIn(context) {
    if (formKey.currentState!.validate()) {
      load.value = true;
      FirebaseServices.instance
          .signInUserWithEmailAndPassWord(
              email: emailController.text, password: pwdController.text)
          .then((value) {
        load.value = false;
        if (value != null) {
          Get.toNamed(Routes.home);
        }
      });
    }
  }
}
