import 'package:get/get.dart';
import '../controllers/controller.dart';

class SearchUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchUserController>(() => (SearchUserController()));
  }
}
