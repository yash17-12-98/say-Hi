class ChatRoom {
  String? chatRoomId;
  List<Users>? users;
  String? lastMessage;
  int? lastTime;

  ChatRoom({this.chatRoomId, this.users, this.lastMessage, this.lastTime});

  ChatRoom.fromJson(Map<String, dynamic> json) {
    chatRoomId = json['chatRoomId'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    lastMessage = json['lastMessage'];
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatRoomId'] = chatRoomId;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    data['lastMessage'] = lastMessage;
    data['lastTime'] = lastTime;
    return data;
  }
}

class Users {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  bool? blocked;

  Users({this.uid, this.name, this.email, this.imageUrl, this.blocked});

  Users.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    blocked = json['blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['blocked'] = blocked;
    return data;
  }
}
