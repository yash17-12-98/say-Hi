import 'package:firebase_auth/firebase_auth.dart';
import 'util.dart';

class FirebaseService {
  FirebaseService._();

  static final _instance = FirebaseService._();

  static FirebaseService get instance => _instance;

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<void> createUserWithEmailAndPassword(
      String name, String? imageUrl, String email, String password) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    Map<String, dynamic> userInfoMap = {
      'name': name,
      'imageUrl': imageUrl,
      'email': email,
      'password': password,
    };
    Common.logger.d("User INFO: $userInfoMap");
    Common.logger.d("UserCredential Userid: ${userCredential.user!.uid}");
    DatabaseMethods.addUserInfoToDb(userCredential.user!.uid, userInfoMap);
  }
}
