import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../routes/page_routes.dart';
import '../widgets/common_separator.dart';
import '../widgets/widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Say Hi!",
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
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CommonTextField(
                      controller: controller.pwdController,
                      hintText: 'Password',
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CommonMaterialButton(
                      color: Colors.blue,
                      text: 'Login',
                      onPressed: () {
                        Get.toNamed(Routes.signup);
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        children: const [
                          Expanded(
                              child: MySeparator(
                            color: Colors.blue,
                          )),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          Expanded(
                              child: MySeparator(
                            color: Colors.blue,
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Don't have an Account?",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.blue, fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.signup);
                            },
                            child: CommonMaterialButton(
                              color: Colors.blue,
                              text: 'Click here',
                              onPressed: () {
                                Get.toNamed(Routes.signup);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
