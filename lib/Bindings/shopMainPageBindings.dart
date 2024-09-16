import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/bottomNavigationController.dart';
import 'package:online_flower_shop/Conrtoller/shop/ShopMainPageController.dart';

import '../Conrtoller/shop/basketController.dart';
import '../Conrtoller/shop/homePageController.dart';
import '../Conrtoller/shop/settingController.dart';

class ShopMainPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ShopMainPageController(),
    );
    Get.lazyPut(
      () => SettingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => Homepagecontroller(),
      fenix: true,
    );
    Get.lazyPut(
      () => BasketController(),
      fenix: true,
    );
    Get.put(
      BottomNavaigatinController(),
      permanent: true,
    );
  }
}
