import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../routes/route.dart';
import '../widgets/common_app_bar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Say H!",
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
      body: SafeArea(child: Container()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.searchUser),
        child: const Icon(Icons.search),
      ),
    );
  }
}
