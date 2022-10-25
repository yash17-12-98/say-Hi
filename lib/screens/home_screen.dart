import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../controllers/controller.dart';
import '../routes/route.dart';
import '../widgets/widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Const.projectName,
        subTitle: "Let's find and say H!",
        onPressed: () => exit(0),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              size: 26.0,
              color: Colors.blue,
            ),
            onPressed: () => Get.toNamed(Routes.profile),
          ),
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CommonListTile(
              title: "user.get('name')",
              subTitle: "user.get('email')",
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.searchUser),
        child: const Icon(Icons.search),
      ),
    );
  }
}
