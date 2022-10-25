import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../utils/util.dart';
import 'controller.dart';

class SearchUserController extends BaseController {
  final TextEditingController searchController = TextEditingController();
  RxList<QueryDocumentSnapshot> snapShotList = <QueryDocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  onFieldSubmitted(value) {
    searchUserByName(value);
  }

  Future<void> searchUserByName(name) async {
    load.value = true;
    await DatabaseService.instance
        .searchUserByName(
            collectionName: Const.userCollectionName,
            name: name)
        .then((value) {
      load.value = false;
      if (value != null) {
        snapShotList.value = value.docs;
      }
    });
  }
}
