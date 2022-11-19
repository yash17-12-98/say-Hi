import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../models/model.dart';
import '../utils/util.dart';
import 'controller.dart';

class ChatController extends BaseController with WidgetsBindingObserver {
  final TextEditingController msgController = TextEditingController();
  Rx<UserModel> receiver = UserModel().obs;
  Rx<UserModel> sender = UserModel().obs;
  RxList<ChatMessage> chats = RxList<ChatMessage>();
  RxList<LastMessage> lastMessage = RxList<LastMessage>();
  RxList<Users> chatUser = RxList<Users>();

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    initData();
    bindStream();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        seen.value = true;
        Common.logger.d("app in resumed ${seen.value}");
        break;
        // return await updateSeenMessage();
      case AppLifecycleState.inactive:
        seen.value = false;
        Common.logger.d("app in inactive ${seen.value}");
        break;
      case AppLifecycleState.paused:
        seen.value = false;
        Common.logger.d("app in paused ${seen.value}");
        break;
      case AppLifecycleState.detached:
        seen.value = false;
        Common.logger.d("app in detached ${seen.value}");
        break;
    }
  }

  bindStream() {
    chats.bindStream(renderChat());
  }

  updateSeenMessage(chatId) async {
    String chatRoomId = getChatRoomIdByUser(
        sender.value.uid.toString(), receiver.value.uid.toString());
    Common.logger.d(
        "Receiver Id: ${chats.last.recId} Receiver Name: ${chats.last.recName}");
    if (chats.last.recId == FirebaseServices.instance.uid) {
      await DatabaseService.instance.updateChatList(
          chatRoomId: chatRoomId,
          data: ChatMessage(seen: true).toMap(),
          chatId: chatId);
      Common.logger.d("Message Updated");
    }
  }

  initData() {
    receiver.value = Get.arguments;
    var jsonData = jsonDecode(
        SharedPreferenceHelper.prefs!.getString(Const.saveUser).toString());
    sender.value = UserModel.fromJson(jsonData);
    chatUser.add(Users(
        name: sender.value.name,
        uid: sender.value.uid,
        email: sender.value.email,
        imageUrl: sender.value.imageUrl,
        blocked: false));
    chatUser.add(Users(
        name: receiver.value.name,
        uid: receiver.value.uid,
        email: receiver.value.email,
        imageUrl: receiver.value.imageUrl,
        blocked: false));
  }

  Stream<List<ChatMessage>> renderChat() {
    return DatabaseService.instance
        .getChatList(getChatRoomIdByUser(
            sender.value.uid.toString(), receiver.value.uid.toString()))
        .map((event) =>
            event.docs.map((doc) => ChatMessage.fromJson(doc.data())).toList());
  }

  String getChatRoomIdByUser(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b.trim()}-${a.trim()}";
    } else {
      return "${a.trim()}-${b.trim()}";
    }
  }

  bool checkChatRoomExist() {
    if (chats.isEmpty) {
      return false;
    }
    return true;
  }

  Future createChatAndSendMessage() async {
    String chatRoomId = getChatRoomIdByUser(
        sender.value.uid.toString(), receiver.value.uid.toString());

    ChatMessage message = ChatMessage(
        message: msgController.text,
        senderId: sender.value.uid,
        senderName: sender.value.name,
        recId: receiver.value.uid,
        recName: receiver.value.name,
        lastMessage: msgController.text,
        time: DateTime.now().microsecondsSinceEpoch,
        seen: seen.value);

    lastMessage.add(LastMessage(
        uid: FirebaseServices.instance.uid,
        message: msgController.text,
        seen: seen.value));

    Common.logger.i("Chat Message: ${message.toMap()}");
    Common.logger.i("Last Message: ${lastMessage.toJson()}");

    if (checkChatRoomExist()) {
      Common.logger.d("CHAT ROOM ALREADY EXIST");
      await sendMessage(chatRoomId, message);
    } else {
      Common.logger.d("CHAT ROOM NOT EXIST");
      await createChatRoom(chatRoomId, message);
    }

    msgController.clear();
  }

  Future createChatRoom(chatRoomId, message) async {
    ChatRoom chatRoom = ChatRoom(
        chatRoomId: chatRoomId,
        users: chatUser.toJson(),
        lastMessage: lastMessage.toJson(),
        lastTime: DateTime.now().microsecondsSinceEpoch);
    Common.logger.i("Chat Room: ${chatRoom.toJson()}");

    bool created = await DatabaseService.instance
        .createChatRoom(chatRoomId: chatRoomId, chatRoom: chatRoom.toJson());

    if (created) {
      await sendMessage(chatRoomId, message);
    }
  }

  Future sendMessage(chatRoomId, message) async {
    await DatabaseService.instance.updateChatRoom(
        chatRoomId: chatRoomId,
        data: ChatRoom(
                lastMessage: lastMessage.toJson(),
                lastTime: DateTime.now().microsecondsSinceEpoch)
            .toJson());
    return await DatabaseService.instance
        .sendMessage(chatRoomId: chatRoomId, message: message.toMap());
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
