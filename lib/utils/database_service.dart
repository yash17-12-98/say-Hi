import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService._();
  static final instance = DatabaseService._();

  static Future addDataToDb(
      String collection, String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(userId)
        .set(userInfoMap);
  }

}
