import 'package:flutter/material.dart';
import '../constants/constant.dart';

class CommonListTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Color? tileColor;
  final bool? isTrailingText;
  final void Function()? onPressed;

  const CommonListTile(
      {Key? key,
      this.title,
      this.subTitle,
      this.tileColor,
      this.onPressed,
      this.isTrailingText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: tileColor ?? Colors.transparent,
      selectedTileColor: Colors.blue.withOpacity(0.3),
      selectedColor: Colors.blue.withOpacity(0.3),
      hoverColor: Colors.blue.withOpacity(0.3),
      focusColor: Colors.blue.withOpacity(0.3),
      mouseCursor: MouseCursor.defer,
      onTap: onPressed,
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          title![0].toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      trailing: isTrailingText == true
          ? TextButton(
              onPressed: onPressed,
              child: const Text(Const.projectName),
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.toString()),
          Visibility(
            visible: isTrailingText == false,
            child: const Text(
              "3:00 A.M",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(subTitle.toString())),
          Visibility(
            visible: isTrailingText == false,
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 17.0,
            ),
          )
        ],
      ),
    );
  }
}
