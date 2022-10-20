import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/widget.dart';
import '../constants/constant.dart';
import '../controllers/controller.dart';

class SearchUser extends GetView<SearchUserController> {
  const SearchUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              color: Colors.blue,
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () => Get.back(),
                            ),
                          ),
                          Expanded(
                            child: CommonTextFormField(
                              controller: controller.searchController,
                              hintText: 'Search User',
                              hintTextStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 30.0,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  controller.searchUserByName();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Obx(
                            () => controller.snapShotList.isNotEmpty
                            ? ListView.separated(
                          padding: const EdgeInsets.only(
                              bottom: kFloatingActionButtonMargin),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller.snapShotList.length,
                          itemBuilder: (context, index) {
                            final user = controller.snapShotList[index];
                            return CommonListTile(
                              title: user.get('name'),
                              subTitle: user.get('email'),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10.0,
                            );
                          },
                        )
                            : Expanded(
                            child: ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImagePath.sadFace,
                                    color: Colors.blue,
                                    scale: 5.0,
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  const Text(
                                    "No User Found",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20.0,
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Text(
                                    "Don't Worry try again!",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17.0,
                                        letterSpacing: 3.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ))),
        Obx(() => CommonLoaderOverlay(
          visible: controller.load.value,
        )),
      ],
    );
  }
}
