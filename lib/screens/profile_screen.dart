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
                              backgroundImage:
                                  controller.imageFile.value == null
                                      ? Image.asset(
                                          ImagePath.userIcon,
                                          color: Colors.white,
                                          scale: 5.5,
                                        ).image
                                      : Image.file(
                                          controller.imageFile.value!,
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
                        CommonTextFormField(
                          controller: controller.pwdController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Password',
                          validator: Validator.isPwdValid,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CommonTextFormField(
                          controller: controller.confirmPwdController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Confirm Password',
                          validator: Validator.isPwdValid,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CommonMaterialButton(
                            color: Colors.blue,
                            text: 'Update',
                            onPressed: () {}),
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
