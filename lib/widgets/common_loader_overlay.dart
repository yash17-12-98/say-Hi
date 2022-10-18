import 'package:flutter/material.dart';

class CommonLoaderOverlay extends StatelessWidget {
  final bool? visible;

  const CommonLoaderOverlay({Key? key, this.visible = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible!,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ModalBarrier(
            color: Colors.blueAccent.withOpacity(0.2),
          ),
          const CircularProgressIndicator(
            color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
