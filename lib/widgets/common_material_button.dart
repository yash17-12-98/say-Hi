import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMaterialButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final Function()? onPressed;

  const CommonMaterialButton({Key? key, this.color, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      padding: const EdgeInsets.all(15.0),
      onPressed: onPressed,
      minWidth: Get.width,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          side: BorderSide.none),
      child: Text(
        text.toString(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
