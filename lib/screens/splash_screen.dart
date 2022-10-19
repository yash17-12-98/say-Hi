import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blueAccent,);
  }
}
