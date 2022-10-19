import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../routes/page_routes.dart';
import '../utils/util.dart';
import '../widgets/widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Say H!",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0),
                  ),
                  Column(
                    children: [
                      CommonTextField(
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        validator: Validator.isEmailValid,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CommonTextField(
                        controller: controller.pwdController,
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        validator: Validator.isPwdValid,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CommonMaterialButton(
                        color: Colors.blue,
                        text: 'Login',
                        onPressed: () => controller.onLogin(),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Get.toNamed(Routes.signup);
                            },
                            child: const Text(
                              "Register here",
                              textAlign: TextAlign.center,
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
                ],
              ),
            ),
          ),
        )),
        Obx(() => CommonLoaderOverlay(
              visible: controller.isLoad.value,
            ))
      ],
    );
  }
}
