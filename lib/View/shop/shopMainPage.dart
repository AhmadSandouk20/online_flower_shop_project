import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/bottomNavigationController.dart';
import 'package:online_flower_shop/Styles/colors.dart';

import '../../Common/preferences.dart';
import '../../Conrtoller/shop/ShopMainPageController.dart';
import '../../common/bottomNavigation/bottomNavigationBar.dart';
import '../../common/sizeConfig.dart';

BottomNavaigatinController bottomController = Get.find();

class ShopMainPage extends StatelessWidget {
  static ShopMainPageController shopMainPageController =
      Get.find<ShopMainPageController>();

  @override
  Widget build(BuildContext context) {
    return GetX<ShopMainPageController>(
      builder: (
        context,
      ) {
        return Scaffold(
          backgroundColor: sharedPrefs.viewMode == "light"
              ? ShopLightColors.secondaryBackgroundColor
              : ShopDarkColors.backgroundColor,
          body: SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Stack(
              children: [
                BottomNavaigatinController
                    .views[bottomController.currentIndex.value],
                Positioned(
                  bottom: 0,
                  child: BottomNavigationBarBuilder.buildBottomNavigationBar(
                    bottomController,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
