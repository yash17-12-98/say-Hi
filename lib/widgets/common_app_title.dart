import 'package:flutter/material.dart';
import '../constants/constant.dart';

class CommonAppTitle extends StatelessWidget {
  final Color? color;

  const CommonAppTitle({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          ImagePath.roundedArrow,
          color: color,
          scale: 4.7,
        ),
        Text(
          "Say H!",
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 45),
        ),
      ],
    );
  }
}
