class UserModel {
  String? name;
  String? email;
  String? imageUrl;
  String? password;

  UserModel({this.name, this.email, this.imageUrl, this.password});

  Map<String, dynamic> toMap() => {
        'name': name,
        'imageUrl': imageUrl,
        'email': email,
        'password': password,
      };
}
