import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:say_hi/utils/shared_preferences_helper.dart';
import '../constants/constant.dart';
import '../models/model.dart';
import 'common.dart';
import 'database_service.dart';

class FirebaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseServices._();

  static final _instance = FirebaseServices._();

  static FirebaseServices get instance => _instance;

  bool get isSignedIn => auth.currentUser != null;

  String? get uid => auth.currentUser != null ? auth.currentUser!.uid : null;

  Future signUpUserWithEmailAndPassword(
      {name, imageUrl, email, password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          name: name,
          email: email,
          imageUrl: imageUrl,
          password: password,
          uid: userCredential.user!.uid);

      // SharedPreferenceHelper.prefs.setString(key, value);
      await DatabaseService.instance.addUserDataToDb(
          collectionName: Const.userCollectionName,
          docId: userCredential.user!.uid,
          fields: userModel.toMap());

      await SharedPreferenceHelper.prefs!.setString('UserModel', jsonEncode(userModel.toMap()));

      await FirebaseServices.instance.userSignOut();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Common.showSnackBar(
            title: 'Weak Password',
            subtitle: 'The password provided is too weak',
            color: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Common.showSnackBar(
            title: 'Email Already Exist',
            subtitle: 'The account already exists for that email',
            color: Colors.red);
      } else {
        Common.showSnackBar(
            title: 'Something went wrong',
            subtitle: e.message.toString(),
            color: Colors.red);
      }
      return null;
    }
  }

  Future<void> reAuthenticateUser(email, password) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

    await auth.currentUser!.reauthenticateWithCredential(credential);
  }

  Future signInUserWithEmailAndPassWord({email, password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Common.logger.d("UserCredential: $userCredential");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Common.showSnackBar(
            title: 'No user found',
            subtitle: 'No user found for that email',
            color: Colors.red);
      } else if (e.code == 'wrong-password') {
        Common.showSnackBar(
            title: 'Wrong password',
            subtitle: 'Wrong password provided for that user',
            color: Colors.red);
      } else {
        Common.showSnackBar(
            title: 'Something went wrong',
            subtitle: e.message.toString(),
            color: Colors.red);
      }
      return null;
    }
  }

  Future<void> userSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
