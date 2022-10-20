import 'package:flutter/material.dart';

class CommonLoaderOverlay extends StatelessWidget {
  final bool? visible;

  const CommonLoaderOverlay({Key? key, this.visible = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible!,
      child: Stack(
        children: [
          ModalBarrier(
            color: Colors.blue.withOpacity(0.15),
          ),
          const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
