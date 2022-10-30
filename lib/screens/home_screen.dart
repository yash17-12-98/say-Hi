import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/utils/firebase_service.dart';
import '../constants/constant.dart';
import '../controllers/controller.dart';
import '../models/model.dart';
import '../routes/route.dart';
import '../widgets/widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Const.projectName,
        subTitle: Const.projectSubTitle,
        onPressed: () => Get.back(),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            icon: const Icon(
              Icons.person,
              size: 25.0,
              color: Colors.blue,
            ),
            onPressed: () => Get.toNamed(Routes.profile),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.searchUser),
              child: CommonTextFormField(
                hintText: 'Search User',
                isEnable: false,
                hintTextStyle:
                    const TextStyle(color: Colors.grey, fontSize: 15.0),
                textInputAction: TextInputAction.search,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.only(
                      bottom: kFloatingActionButtonMargin),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.chatRooms.length,
                  itemBuilder: (context, index) {
                    final chatRoom = controller.chatRooms[index];
                    return CommonListTile(
                      title: controller.getReceiver(chatRoom).name,
                      subTitle: controller.chatRooms[index].lastMessage,
                      onPressed: () => Get.toNamed(Routes.chat,
                          arguments: UserModel(
                              uid: controller.getReceiver(chatRoom).uid,
                              name: controller.getReceiver(chatRoom).name,
                              email: controller.getReceiver(chatRoom).email,
                              imageUrl:
                                  controller.getReceiver(chatRoom).imageUrl)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
