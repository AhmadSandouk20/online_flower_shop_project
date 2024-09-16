import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/LogControllers/loginController.dart';

class LogBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
    );
  }
}
