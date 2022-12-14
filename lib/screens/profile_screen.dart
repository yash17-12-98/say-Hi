import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../controllers/controller.dart';
import '../utils/util.dart';
import '../widgets/widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
            appBar: CommonAppBar(
              title: 'Profile',
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Colors.blue,
                  tooltip: 'Log out',
                  onPressed: () => controller.onSignOut(),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            // await controller.updateImage();
                          },
                          child: Obx(
                            () => CircleAvatar(
                              radius: 50,
                              backgroundImage: controller.user.value.imageUrl !=
                                      null
                                  ? Image.network(
                                      controller.user.value.imageUrl.toString(),
                                      color: Colors.white,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                      scale: 5.5,
                                    ).image
                                  : Image.asset(
                                      ImagePath.userIcon,
                                      fit: BoxFit.fill,
                                    ).image,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CommonTextFormField(
                          controller: controller.nameController,
                          keyboardType: TextInputType.text,
                          hintText: 'Name',
                          validator: Validator.isNameValid,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CommonTextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          validator: Validator.isEmailValid,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        Obx(() => CommonLoaderOverlay(
              visible: controller.load.value,
            ))
      ],
    );
  }
}
