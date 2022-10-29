class Message {
  String? message;
  String? senderId;
  String? senderName;
  String? recId;
  String? recName;
  String? lastMessage;
  int? time;

  Message(
      {this.message,
      this.senderId,
      this.senderName,
      this.recId,
      this.recName,
      this.lastMessage,
      this.time});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    senderId = json['senderId'];
    senderName = json['senderName'];
    recId = json['recId'];
    recName = json['recName'];
    time = json['time'];
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'senderId': senderId,
        'senderName': senderName,
        'recId': recId,
        'recName': recName,
        'time': time,
      };
}
