import 'package:flutter/material.dart';
import '../constants/constant.dart';

class CommonListTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Color? tileColor;
  final void Function()? onPressed;

  const CommonListTile(
      {Key? key, this.title, this.subTitle, this.tileColor, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: tileColor ?? Colors.transparent,
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          title![0].toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: const Text(Const.projectName),
      ),
      title: Text(title.toString()),
      subtitle: Text(subTitle.toString()),
    );
  }
}
