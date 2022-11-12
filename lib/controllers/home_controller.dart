import 'dart:async';

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
    bindStream();
    super.onInit();
  }

  bindStream() {
    chatRooms.bindStream(renderChatRoom());
  }

  Users getReceiver(chatRooms) {
    return chatRooms.users!
        .where((element) => element.uid != FirebaseServices.instance.uid)
        .last;
  }

  Stream<List<ChatRoom>> renderChatRoom() {
    return DatabaseService.instance.getChatRoomList().map((event) => event.docs
        .where((element) => element.exists)
        .map((doc) => ChatRoom.fromJson(doc.data()))
        .toList());
  }

  @override
  void onClose() {
    super.onClose();
  }
}
