import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../controllers/controller.dart';
import '../utils/util.dart';
import '../widgets/widget.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 30.0,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: const Text(
                'Create an account',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await controller.updateImage();
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
                              width: 15.0,
                            ),
                            Expanded(
                              child: CommonTextFormField(
                                controller: controller.nameController,
                                keyboardType: TextInputType.text,
                                hintText: 'Name',
                                validator: Validator.isNameValid,
                              ),
                            ),
                          ],
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
                          minWidth: Get.width,
                          text: 'Sign Up',
                          onPressed: () => controller.signup(),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?  ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Get.back();
                              },
                              child: const Text(
                                "Login now",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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
