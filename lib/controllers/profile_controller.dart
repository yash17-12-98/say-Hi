import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model.dart';
import '../constants/constant.dart';
import '../routes/route.dart';
import '../utils/util.dart';
import 'controller.dart';

class ProfileController extends BaseController {
  final imageFile = Rxn<File>();
  final formKey = GlobalKey<FormState>();
  Rx<UserModel> user = UserModel().obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    load.value = true;
    var value = await DatabaseService.instance.getUserDataFromDb(
        collectionName: Const.userCollectionName,
        docId: FirebaseServices.instance.uid);
    if (value != null) {
      user.value = UserModel.fromJson(value);
      nameController.text = user.value.name.toString();
      emailController.text = user.value.email.toString();
    }
    load.value = false;
  }

  Future onSignOut() async {
    await SharedPreferenceHelper.prefs!.clear();
    await FirebaseServices.instance.userSignOut();
    Get.offNamedUntil(Routes.login, (route) => false);
  }
}
