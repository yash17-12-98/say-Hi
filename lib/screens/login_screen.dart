import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/util.dart';
import '../controllers/controller.dart';
import '../routes/route.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CommonAppTitle(color: Colors.blue,),
                      Column(
                        children: [
                          CommonTextFormField(
                            controller: controller.emailController,
                            hintText: "Email",
                            validator: Validator.isEmailValid,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CommonTextFormField(
                            controller: controller.pwdController,
                            hintText: "Password",
                            validator: Validator.isPwdValid,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CommonMaterialButton(
                            text: "Sign in",
                            color: Colors.blue,
                            minWidth: Get.width,
                            onPressed: () => controller.signIn(context),
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
                                  Get.toNamed(Routes.signup);
                                },
                                child: const Text(
                                  "Register",
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
          visible: controller.load.value,
        )),
      ],
    );
  }
}
