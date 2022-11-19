class ChatRoom {
  String? chatRoomId;
  List<Users>? users;
  List<LastMessage>? lastMessage;
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
    if (json['lastMessage'] != null) {
      lastMessage = <LastMessage>[];
      json['lastMessage'].forEach((v) {
        lastMessage!.add(LastMessage.fromJson(v));
      });
    }
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatRoomId'] = chatRoomId;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (lastMessage != null) {
      data['lastMessage'] = lastMessage!.map((v) => v.toJson()).toList();
    }
    data['lastTime'] = lastTime;
    return data;
  }
}

class LastMessage {
  String? uid;
  String? message;
  bool? seen;

  LastMessage({this.uid, this.message, this.seen});

  LastMessage.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    message = json['message'];
    seen = json['seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['message'] = message;
    data['seen'] = seen;
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
