import 'package:flutter/material.dart';

class LeftChatRoomTile extends StatelessWidget {
  final Function()? onTap;
  final String? name;
  final String? count;
  final String? lastMessage;

  const LeftChatRoomTile(
      {Key? key, this.onTap, this.name, this.lastMessage, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(
                name![0].toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 17),
                        ),
                        const Text(
                          "3:00 A.M",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            lastMessage ?? "No Message",
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 14),
                          ),
                        ),
                        Visibility(
                          visible: count != null,
                          child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Colors.blueGrey,
                            child: Text(
                              count.toString(),
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
