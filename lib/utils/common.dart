import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class Common {
  static const userCollectionName = 'users';
  static var logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static Future<File?> pickImageFromGallery() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  static showSnackBar({title, subtitle, color}) {
    Get.snackbar(
      title,
      subtitle,
      colorText: Colors.white,
      icon: const Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
    );
  }
}
