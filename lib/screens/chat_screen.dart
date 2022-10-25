import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../widgets/custom_shape.dart';
import '../widgets/widget.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: controller.userModel.value.name,
        subTitle: controller.userModel.value.email,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding:
                    const EdgeInsets.only(bottom: kFloatingActionButtonMargin),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return index % 2 != 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(18),
                                    ),
                                  ),
                                  child: Text(
                                    "Hi jhfjkhsdfhjskdhfsdhfkjhsdjfhksjdhfkdjhjkdfnvjdxfnvdnfnvkjdnfjknvjkndfjknvjkndjknfvj",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              CustomPaint(painter: CustomShape(Colors.blue)),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: CustomPaint(
                                  painter: CustomShape(Colors.grey[300]!),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(18),
                                    ),
                                  ),
                                  child: Text(
                                    "message",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 0.0,
                    )),
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
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
            ),
          )
        ],
      )),
    );
  }
}

