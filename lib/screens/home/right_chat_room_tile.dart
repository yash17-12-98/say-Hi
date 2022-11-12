import 'package:flutter/material.dart';

class RightChatRoomTile extends StatelessWidget {
  final Function()? onTap;
  final String? name;
  final String? lastMessage;

  const RightChatRoomTile({Key? key, this.onTap, this.name, this.lastMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "3:00 A.M",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Text(
                          name ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      lastMessage ?? "No Message",
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                name![0].toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
