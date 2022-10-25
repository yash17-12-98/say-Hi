import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:say_hi/utils/database_service.dart';
import 'package:say_hi/utils/firebase_service.dart';
import '../models/model.dart';
import 'controller.dart';

class ChatController extends BaseController {
  final TextEditingController msgController = TextEditingController();
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onInit() {
    userModel.value = Get.arguments;
    print("userModel: ${userModel.value.toMap()}");
    // print("display name: ${FirebaseServices.instance.auth.currentUser?.}");
    super.onInit();
  }

  String getChatRoomIdByUserId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b-$a";
    } else {
      return "$a-$b";
    }
  }

  sendMessage(){
    // DatabaseService.instance.sendMessage(chatRoomId: getChatRoomIdByUserId(userModel.value.name, FirebaseServices.instance.auth.currentUser.displayName));
  }


}
