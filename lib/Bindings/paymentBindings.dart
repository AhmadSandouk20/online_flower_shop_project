import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/paymentController.dart';

class Paymentbindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      PaymentController(),
    );
  }
}
