import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../View/shop/homePage.dart';
import '../View/shop/settings.dart';
import '../View/shop/basket.dart';
import '../common/bottomNavigation/bottomNavigatinBarItem.dart';
import '../common/sizeConfig.dart';

class BottomNavaigatinController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<NavigationIconButton> navigationIconButtonList = [];

// TODO here the way
  static final List<Widget> views = [
    Positioned(
      bottom: SizeConfig.screenHeight * 9 / 100,
      top: 0,
      child: const HomePage(),
    ),
    ShoppingBasket(),
    Settings(),
  ];
}
