import 'package:cloud_firestore/cloud_firestore.dart';
import 'common.dart';

class DatabaseService {
  DatabaseService._();

  static final _instance = DatabaseService._();

  static DatabaseService get instance => _instance;

  Future<void> addUserDataToDb({collectionName, docId, fields}) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId)
        .set(fields);
  }

  Future<Map<String, dynamic>?> getUserDataFromDb(
      {collectionName, docId}) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docId)
          .get();
      return snapshot.data() as Map<String, dynamic>;
    } catch (e) {
      Common.logger.e("Exception: $e");
      return null;
    }
  }

  Future<QuerySnapshot?> searchUserByName({collectionName, name}) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('name', isEqualTo: name)
          .get();
      return snapshot;
    } catch (e) {
      Common.logger.e("Exception: $e");
      return null;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatList(chatRoomId) {
    return FirebaseFirestore.instance
        .collection('chat-room')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy('time')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatRoomList() {
    return FirebaseFirestore.instance.collection('chat-room').snapshots();
  }

  Future createChatRoom({chatRoom, chatRoomId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('chat-room')
          .doc(chatRoomId)
          .set(chatRoom);
      return true;
    } catch (e) {
      Common.logger.e("Exception: $e");
      return null;
    }
  }

  Future sendMessage({chatRoomId, message}) async {
    try {
      await FirebaseFirestore.instance
          .collection('chat-room')
          .doc(chatRoomId)
          .collection('chats')
          .add(message);
      return true;
    } catch (e) {
      Common.logger.e("Exception: $e");
      return null;
    }
  }

  Future updateUserDataFromDb({collectionName, docId, data}) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docId)
          .update(data);
      return true;
    } catch (e) {
      Common.logger.e("Exception: $e");
      return null;
    }
  }
}
