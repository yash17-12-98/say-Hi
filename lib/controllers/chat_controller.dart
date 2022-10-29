import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../models/model.dart';
import '../utils/util.dart';
import 'controller.dart';

class ChatController extends BaseController {
  final TextEditingController msgController = TextEditingController();
  Rx<UserModel> receiver = UserModel().obs;
  Rx<UserModel> sender = UserModel().obs;
  RxList<Message> chats = RxList<Message>();

  @override
  void onInit() {
    receiver.value = Get.arguments;
    initData();
    bindStream();
    Common.logger.d("receiver: ${receiver.value.toMap()}");
    Common.logger.d("sender: ${sender.value.toMap()}");
    Common.logger.d("firebse uid: ${FirebaseServices.instance.uid}");
    super.onInit();
  }

  bindStream() {
    chats.bindStream(renderChat());
  }

  initData() {
    var jsonData = jsonDecode(
        SharedPreferenceHelper.prefs!.getString(Const.saveUser).toString());
    sender.value = UserModel.fromJson(jsonData);
  }

  Stream<List<Message>> renderChat() {
    return DatabaseService.instance
        .getChatList(getChatRoomIdByUser(
            sender.value.name.toString(), receiver.value.name.toString()))
        .map((event) =>
            event.docs.map((doc) => Message.fromJson(doc.data())).toList());
  }

  String getChatRoomIdByUser(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b.trim()}-${a.trim()}";
    } else {
      return "${a.trim()}-${b.trim()}";
    }
  }

  Future sendMessage() async {
    Message message = Message(
        message: msgController.text,
        senderId: sender.value.uid,
        senderName: sender.value.name,
        recId: receiver.value.uid,
        recName: receiver.value.name,
        time: DateTime.now().microsecondsSinceEpoch);

    String chatRoomId = getChatRoomIdByUser(
        sender.value.name.toString(), receiver.value.name.toString());
    // await DatabaseService.instance.createChatRoom(chatRoomId: chatRoomId);

    await DatabaseService.instance
        .sendMessage(chatRoomId: chatRoomId, message: message.toMap());
    msgController.clear();
  }
}
