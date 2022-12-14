import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final String? subTitle;
  final bool? specific;
  final bool? isUser;
  final bool? isHome;
  final double? toolBarHeight;
  final ShapeBorder? shape;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final void Function()? onPressed;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const CommonAppBar(
      {Key? key,
      this.title,
      this.specific = false,
      this.onPressed,
      this.actions,
      this.subTitle,
      this.isUser = false,
      this.leadingWidth = 40,
      this.bottom,
      this.backgroundColor,
      this.shape,
      this.isHome = false,
      this.toolBarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
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
          : InkWell(
              onTap: onPressed ?? Get.back,
              splashColor: Colors.blue.withOpacity(0.3),
              hoverColor: Colors.blue,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: isHome == false ? Colors.blue : Colors.white,
                    ),
                  ),
                  Visibility(
                    visible: isUser!,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blue,
                      child: Text(
                        title![0].toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: TextStyle(
                color: isHome == true ? Colors.white : Colors.blue,
                fontSize: 17),
          ),
          subTitle != null
              ? Text(
                  subTitle.toString(),
                  style: TextStyle(
                      color: isHome == true ? Colors.white70 : Colors.grey,
                      fontSize: 12),
                )
              : Container(),
        ],
      ),
      bottom: bottom,
      elevation: 0.0,
      shape: shape,
      backgroundColor: backgroundColor ?? Colors.transparent,
      titleTextStyle: const TextStyle(
          color: Colors.blue, fontSize: 25.0, fontWeight: FontWeight.w500),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight ?? kToolbarHeight);
}
