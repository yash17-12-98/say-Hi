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
        subTitle: "Don't miss chance to say first H!",
        onPressed: () => Get.back(),
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
              child: ListView.builder(
                padding:
                    const EdgeInsets.only(bottom: kFloatingActionButtonMargin),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const CommonListTile(
                    title: "user.get('name')",
                    subTitle: "user.get('email')",
                  );
                },
              ),
            ),
          ],
        ),
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.toNamed(Routes.searchUser),
      //   child: const Icon(Icons.search),
      // ),
    );
  }
}
