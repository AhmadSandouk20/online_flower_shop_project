import 'package:get/get.dart';

class BasketController extends GetxController {
  int _delivery = 0;
  int _taxes = 0;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;
  int get taxes => _taxes;
  int get delivery => _delivery;

  calculateTotalPrice({
    required int delivery,
    required int taxes,
  }) {
    _totalPrice = _delivery + _taxes;
    update();
  }

  set delivery(int value) {
    _delivery = value;
    update();
  }

  set taxes(int value) {
    _taxes = value;
    update();
  }
}
