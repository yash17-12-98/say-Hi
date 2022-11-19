import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/screens/home/left_chat_room_tile.dart';
import 'package:say_hi/screens/home/right_chat_room_tile.dart';
import 'package:say_hi/utils/firebase_service.dart';
import '../../constants/constant.dart';
import '../../controllers/controller.dart';
import '../../models/model.dart';
import '../../routes/route.dart';
import '../../widgets/widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Const.projectName,
        subTitle: Const.projectSubTitle,
        backgroundColor: Colors.blue,
        toolBarHeight: kToolbarHeight + 70,
        isHome: true,
        onPressed: () => Get.back(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18))),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.searchUser),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
              child: CommonTextFormField(
                hintText: 'Search User',
                fillColor: Colors.grey[200],
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
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            icon: const Icon(
              Icons.person,
              size: 25.0,
              color: Colors.white,
            ),
            onPressed: () => Get.toNamed(Routes.profile),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          () => controller.chatRooms.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: kFloatingActionButtonMargin),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.chatRooms.length,
                  itemBuilder: (context, index) {
                    final chatRoom = controller.chatRooms[index];

                    return chatRoom.lastMessage!.last.uid ==
                            FirebaseServices.instance.uid
                        ? RightChatRoomTile(
                            name: controller.getReceiver(chatRoom).name,
                            lastMessage: controller
                                .chatRooms[index].lastMessage!.last.message,
                            onTap: () => Get.toNamed(Routes.chat,
                                arguments: UserModel(
                                    uid: controller.getReceiver(chatRoom).uid,
                                    name: controller.getReceiver(chatRoom).name,
                                    email:
                                        controller.getReceiver(chatRoom).email,
                                    imageUrl: controller
                                        .getReceiver(chatRoom)
                                        .imageUrl)),
                          )
                        : LeftChatRoomTile(
                            name: controller.getReceiver(chatRoom).name,
                            lastMessage: chatRoom.lastMessage!.last.message,
                            count: chatRoom.lastMessage!.length.toString(),
                            onTap: () => Get.toNamed(Routes.chat,
                                arguments: UserModel(
                                    uid: controller.getReceiver(chatRoom).uid,
                                    name: controller.getReceiver(chatRoom).name,
                                    email:
                                        controller.getReceiver(chatRoom).email,
                                    imageUrl: controller
                                        .getReceiver(chatRoom)
                                        .imageUrl)),
                          );
                    /*InkWell(
                            onTap: () => Get.toNamed(Routes.chat,
                                arguments: UserModel(
                                    uid: controller.getReceiver(chatRoom).uid,
                                    name: controller.getReceiver(chatRoom).name,
                                    email:
                                        controller.getReceiver(chatRoom).email,
                                    imageUrl: controller
                                        .getReceiver(chatRoom)
                                        .imageUrl)),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                  bottomRight: Radius.circular(18),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    child: Text(
                                      controller
                                          .getReceiver(chatRoom)
                                          .name![0]
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller
                                                        .getReceiver(chatRoom)
                                                        .name ??
                                                    '',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontSize: 17),
                                              ),
                                              const Text(
                                                "3:00 A.M",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                          Text(
                                            controller.chatRooms[index]
                                                    .lastMessage!['message'] ??
                                                "No Message",
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )*/

                    /*CommonListTile(
                            tileColor: Colors.blueGrey.withOpacity(0.3),
                            title: controller.getReceiver(chatRoom).name,
                            subTitle: controller
                                .chatRooms[index].lastMessage!['message'],
                            onPressed: () => Get.toNamed(Routes.chat,
                                arguments: UserModel(
                                    uid: controller.getReceiver(chatRoom).uid,
                                    name: controller.getReceiver(chatRoom).name,
                                    email:
                                        controller.getReceiver(chatRoom).email,
                                    imageUrl: controller
                                        .getReceiver(chatRoom)
                                        .imageUrl)),
                          );*/
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10.0,
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "No Chat Found",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        "Search and chat with Hi-mate",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ],
                  ),
                ),
        ),
      )),
    );
  }
}
