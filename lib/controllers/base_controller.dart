import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool load = false.obs;
  RxBool visible = true.obs;
  RxBool seen = false.obs;
}
