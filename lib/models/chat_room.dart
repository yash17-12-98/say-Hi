class ChatRoomModel {
  String? recId;
  String? recName;
  String? recEmail;
  String? recImageUrl;
  String? lastMessage;
  String? lastTime;

  ChatRoomModel(
      {this.recId,
      this.recName,
      this.recEmail,
      this.recImageUrl,
      this.lastMessage,
      this.lastTime});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    recId = json['recId'];
    recName = json['recName'];
    recEmail = json['recEmail'];
    recImageUrl = json['recImageUrl'];
    lastMessage = json['lastMessage'];
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toMap() => {
        'recId': recId,
        'recName': recName,
        'recEmail': recEmail,
        'recImageUrl': recImageUrl,
        'lastMessage': lastMessage,
        'lastTime': lastTime,
      };
}
