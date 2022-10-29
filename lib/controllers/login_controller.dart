import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
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

  Future<void> signIn(context) async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      load.value = true;
      var signInUser = await FirebaseServices.instance
          .signInUserWithEmailAndPassWord(
          email: emailController.text, password: pwdController.text);
      if (signInUser != null) {
        var value = await DatabaseService.instance.getUserDataFromDb(
            collectionName: Const.userCollectionName,
            docId: signInUser.user!.uid);
        await SharedPreferenceHelper.prefs!
            .setString(Const.saveUser, jsonEncode(value));
        Get.offNamed(Routes.home);
      }
      load.value = false;
    }
  }
}
