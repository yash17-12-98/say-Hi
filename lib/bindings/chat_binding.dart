import 'package:get/get.dart';
import '../controllers/controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => (ChatController()));
  }
}
