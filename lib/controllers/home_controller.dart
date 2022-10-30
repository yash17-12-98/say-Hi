import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model.dart';
import '../utils/util.dart';
import 'controller.dart';

class HomeController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  RxList<ChatRoom> chatRooms = RxList<ChatRoom>();

  @override
  void onInit() {
    print("Init");
    bindStream();
    super.onInit();
  }

  bindStream() {
    chatRooms.bindStream(renderChatRoom());
  }

  Users getReceiver(chatRooms) {
    return chatRooms.users!
        .where((element) => element.uid != FirebaseServices.instance.uid)
        .single;
  }

  Stream<List<ChatRoom>> renderChatRoom() {
    return DatabaseService.instance.getChatRoomList().map((event) =>
        event.docs.map((doc) => ChatRoom.fromJson(doc.data())).toList());
  }

  @override
  void onClose() {
    super.onClose();
  }
}
