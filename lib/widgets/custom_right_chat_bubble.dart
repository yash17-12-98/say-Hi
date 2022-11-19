import 'package:flutter/material.dart';
import 'custom_shape.dart';

class CustomRightChatBubble extends StatelessWidget {
  final String? message;
  final bool? seen;

  const CustomRightChatBubble({Key? key, this.message, this.seen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("seen $seen");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 20, bottom: 14, top: 14),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.done_all,
                    size: 15.0,
                    color: seen == false || seen == null
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          CustomPaint(painter: CustomShape(Colors.grey)),
        ],
      ),
    );
  }
}
