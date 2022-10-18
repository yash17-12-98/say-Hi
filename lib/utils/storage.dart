import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'common.dart';

class Storage {
  Storage._();

  static final _instance = Storage._();

  static Storage get instance => _instance;

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref("users/$fileName").putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      Common.logger.e("Exception: $e");
    }
  }

  Future<String?> getDownloadedUrl(String fileName) async {
    try {
      return await storage.ref("users/$fileName").getDownloadURL();
    } on firebase_core.FirebaseException catch (e) {
      Common.logger.e("Exception: $e");
    }
    return null;
  }
}
