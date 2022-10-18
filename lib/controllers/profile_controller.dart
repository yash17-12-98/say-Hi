import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ProfileController extends BaseController{
  final imageFile = Rxn<File>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
}