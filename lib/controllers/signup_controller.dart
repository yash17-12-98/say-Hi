import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../constants/constant.dart';
import '../utils/storage.dart';
import '../utils/util.dart';
import 'controller.dart';

class SignupController extends BaseController {
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

  Future<void> updateImage() async {
    imageFile.value = await Common.pickImageFromGallery();
    if (imageFile.value != null) {
      Common.logger.d("ImageFile Path: ${imageFile.toString()}");
      Common.logger
          .d("ImageFile Name: ${imageFile.value!.path.split('/').last}");
    }
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    final file =
        File('${(await getTemporaryDirectory()).path}/${path.split("/").last}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  Future<bool> uploadFile(imageFile) async {
    if (imageFile != null) {
      await Storage.instance
          .uploadFile(imageFile.path, imageFile.path.split('/').last);
      return true;
    }
    return false;
  }

  Future<String?> getDownloadedFileUrl(isUploaded) async {
    return isUploaded
        ? await Storage.instance
            .getDownloadedUrl(imageFile.value!.path.split('/').last)
        : null;
  }

  checkFileImg() async {
    if (imageFile.value != null) {
      return imageFile.value;
    }
    imageFile.value = await getImageFileFromAssets(ImagePath.userIcon);
    return imageFile.value;
  }

  Future<void> signup() async {
    Get.focusScope!.unfocus();
    if (formKey.currentState!.validate()) {
      load.value = true;
      var imgFile = await checkFileImg();
      var isUploaded = await uploadFile(imgFile);
      var imageUrl = await getDownloadedFileUrl(isUploaded);
      Common.logger.d("FILE UPLOADED FOR $imageUrl");
      FirebaseServices.instance
          .signUpUserWithEmailAndPassword(
              name: nameController.text,
              imageUrl: imageUrl,
              email: emailController.text,
              password: confirmPwdController.text)
          .then((value) {
        load.value = false;
        if (value != null) {
          Get.back();
          Common.showSnackBar(
              title: "SIGNUP",
              subtitle: "Account created successfully",
              color: Colors.green);
        }
      });
    }
  }
}
