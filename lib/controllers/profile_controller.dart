import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route.dart';
import '../utils/util.dart';
import 'controller.dart';

class ProfileController extends BaseController {
  final imageFile = Rxn<File>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  onSignOut() async {
    await FirebaseServices.instance.userSignOut();
    Get.offNamedUntil(Routes.login, (route) => false);
  }
}
