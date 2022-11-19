class ChatMessage {
  String? chatId;
  String? message;
  String? senderId;
  String? senderName;
  String? recId;
  String? recName;
  String? lastMessage;
  int? time;
  bool? seen;

  ChatMessage(
      {this.chatId,
      this.message,
      this.senderId,
      this.senderName,
      this.recId,
      this.recName,
      this.lastMessage,
      this.time,
      this.seen});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    message = json['message'];
    senderId = json['senderId'];
    senderName = json['senderName'];
    recId = json['recId'];
    recName = json['recName'];
    time = json['time'];
    seen = json['seen'];
  }

  Map<String, dynamic> toMap() => {
        'chatId': chatId,
        'message': message,
        'senderId': senderId,
        'senderName': senderName,
        'recId': recId,
        'recName': recName,
        'time': time,
        'seen': seen,
      };
}
