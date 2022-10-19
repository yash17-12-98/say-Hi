class UserModel {
  String? name;
  String? email;
  String? imageUrl;
  String? password;
  String? uid;

  UserModel({this.name, this.email, this.imageUrl, this.password, this.uid});

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['imageUrl'];
    imageUrl = json['imageUrl'];
    password = json['password'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() => {
        'name': name,
        'imageUrl': imageUrl,
        'email': email,
        'password': password,
        'uid': uid,
      };
}
