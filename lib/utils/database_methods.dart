import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseMethods {
  static Future addUserInfoToDb(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(userInfoMap);
  }
}
