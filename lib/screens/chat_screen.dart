import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../utils/util.dart';
import '../widgets/widget.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        isUser: true,
        leadingWidth: 70.0,
        title: controller.receiver.value.name,
        subTitle: controller.receiver.value.email,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Obx(
              () => SingleChildScrollView(
                reverse: true,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: controller.chats.length,
                    itemBuilder: (context, index) {
                      return controller.chats[index].senderId ==
                              FirebaseServices.instance.uid
                          ? CustomRightChatBubble(
                              message: controller.chats[index].message)
                          : CustomLeftChatBubble(
                              message: controller.chats[index].message);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          height: 0.0,
                        )),
              ),
            ),
          ),
          CommonTextFormField(
            controller: controller.msgController,
            hintText: 'Message...',
            hintTextStyle: const TextStyle(color: Colors.grey, fontSize: 15.0),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.send,
                size: 30.0,
                color: Colors.blue,
              ),
              onPressed: () => controller.createChatAndSendMessage(),
            ),
          )
        ],
      )),
    );
  }
}
