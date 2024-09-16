import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/bottomNavigationController.dart';

import '../../Styles/colors.dart';
import '../../View/shop/clipers/bottomNavigationBarClipper.dart';
import '../shopImages.dart';
import '../sizeConfig.dart';
import 'bottomNavigatinBarItem.dart';

class BottomNavigationBarBuilder {
  static Widget buildBottomNavigationBar(
    BottomNavaigatinController bottomNavigationController,
  ) {
    return GetBuilder<BottomNavaigatinController>(builder: (context) {
      return Container(
        height: SizeConfig.screenHeight * 9 / 100,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 5 / 100,
        ),
        decoration: const BoxDecoration(
          color: ShopLightColors.primaryBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              40,
            ),
            topRight: Radius.circular(
              40,
            ),
            // TODO
            bottomLeft: Radius.circular(
              0,
            ),
            bottomRight: Radius.circular(
              0,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (
            context,
            constrains,
          ) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NavigationIconButton(
                        currentIndex:
                            bottomNavigationController.currentIndex.value,
                        onPressed: (indexVal) {
                          bottomNavigationController.currentIndex.value =
                              indexVal;
                        },
                        index: 0,
                        imageProvider: AssetImage(
                          ShopImages.home,
                        ),
                        fatherConstrains: constrains,
                      ),
                      NavigationIconButton(
                        currentIndex:
                            bottomNavigationController.currentIndex.value,
                        onPressed: (indexVal) {
                          bottomNavigationController.currentIndex.value =
                              indexVal;
                        },
                        index: 1,
                        imageProvider: AssetImage(
                          ShopImages.shoppingBasket,
                        ),
                        fatherConstrains: constrains,
                      ),
                      NavigationIconButton(
                        currentIndex:
                            bottomNavigationController.currentIndex.value,
                        index: 2,
                        onPressed: (indexVal) {
                          bottomNavigationController.currentIndex.value =
                              indexVal;
                        },
                        imageProvider: AssetImage(
                          ShopImages.settings,
                        ),
                        fatherConstrains: constrains,
                      ),
                      Image.asset(
                        "assets/images/Bottomnav/userImage.png",
                        height: constrains.maxHeight * 45 / 100,
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  top: constrains.maxHeight * 79 / 100,
                  left: animatedPositionedValues(
                    bottomNavigationController.currentIndex.value,
                    constrains,
                  ),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: BottomNavigationBarClipper(),
                        child: Container(
                          height: constrains.maxHeight * 15 / 100,
                          width: constrains.maxWidth * 10 / 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradient,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: constrains.maxHeight * 5 / 100,
                        width: constrains.maxWidth * 10 / 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                          color: ShopLightColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}

double animatedPositionedValues(
  int currentIndex,
  constrains,
) {
  switch (currentIndex) {
    case 0:
      return constrains.maxWidth * 2.5 / 100;
    case 1:
      return constrains.maxWidth * 32 / 100;
    default:
      return constrains.maxWidth * 62 / 100;
  }
}

final List<Color> gradient = [
  ShopLightColors.primaryColor.withOpacity(
    0.8,
  ),
  ShopLightColors.primaryColor.withOpacity(
    0.5,
  ),
  Colors.transparent,
];
