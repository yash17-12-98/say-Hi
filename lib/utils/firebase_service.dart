import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/model.dart';
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
      {String? name, String? imageUrl, String? email, String? password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      UserModel userModel = UserModel(
          name: name, imageUrl: imageUrl, email: email, password: password);
      Common.logger.i("User INFO: ${userModel.toMap()}");
      Common.logger.i("UserCredential: $userCredential");
      DatabaseMethods.addUserInfoToDb(
          userCredential.user!.uid, userModel.toMap());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Common.showSnackBar(
            title: 'Invalid password',
            subtitle: 'The password provided is too weak.',
            color: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Common.showSnackBar(
            title: 'Account Exist',
            subtitle: 'The account already exists for that email',
            color: Colors.red);
      }
    } catch (e) {
      Common.logger.e("Exception: $e");
    }
  }

  Future<void> signInUserWithEmailAndPassword(
      {String? email, String? password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      Common.logger.i("UserCredential: ${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Common.showSnackBar(
            title: 'No User Found',
            subtitle: 'No user found for that email',
            color: Colors.red);
      } else if (e.code == 'wrong-password') {
        Common.showSnackBar(
            title: 'Wrong password',
            subtitle: 'Wrong password provided for that user.',
            color: Colors.red);
      } else {
        Common.logger.e("Exception: $e");
      }
    }
  }

  Future<void> userSignOut() async {
    await auth.signOut();
  }
}
