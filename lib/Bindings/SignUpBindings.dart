import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/LogControllers/SignUpController.dart';

class Signupbindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SignUpController(),
    );
  }
}
