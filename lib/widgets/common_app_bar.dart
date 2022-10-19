import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final void Function()? onPressed;

  const CommonAppBar({Key? key, this.title, this.onPressed, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: () => onPressed ?? Get.back()),
      title: Text(
        title.toString(),
        style: const TextStyle(color: Colors.blue, fontSize: 25),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
