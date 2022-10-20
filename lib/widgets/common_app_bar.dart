import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final String? subTitle;
  final bool? specific;
  final void Function()? onPressed;
  final List<Widget>? actions;

  const CommonAppBar(
      {Key? key,
      this.title,
      this.specific = false,
      this.onPressed,
      this.actions,
      this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: specific == true
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: onPressed ?? Get.back,
                ),
              ),
            )
          : IconButton(
              color: Colors.blue,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onPressed ?? Get.back,
            ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(color: Colors.blue, fontSize: 17),
          ),
          subTitle != null
              ? Text(
                  subTitle.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                )
              : Container(),
        ],
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
          color: Colors.blue, fontSize: 25.0, fontWeight: FontWeight.w500),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
