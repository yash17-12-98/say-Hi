class ChatRoom {
  String? chatRoomId;
  Users? users;
  String? lastMessage;
  String? lastTime;

  ChatRoom({this.chatRoomId, this.users, this.lastMessage, this.lastTime});

  ChatRoom.fromJson(Map<String, dynamic> json) {
    chatRoomId = json['chatRoomId'];
    users = json['users'];
    lastMessage = json['lastMessage'];
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toMap() => {
        'chatRoomId': chatRoomId,
        'users': users,
        'lastMessage': lastMessage,
        'lastTime': lastTime,
      };
}

class Users {

}

class First {
  String? uid;
  String? name;
  bool? blocked;

  First({this.uid, this.name, this.blocked});

  First.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    blocked = json['blocked'];
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'blocked': blocked,
      };
}
