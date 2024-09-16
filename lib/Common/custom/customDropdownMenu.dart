import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Conrtoller/shop/settingController.dart';
import '../../Styles/colors.dart';
import 'customText.dart';

class CustomDropdownMenu {
  static buildCustomDropDownMenu({
    clicked = false,
    required fatherCons,
    required label,
    required SettingController settingsController,
    Widget? settingChildren,
  }) {
    return Column(
      children: [
        GetBuilder<SettingController>(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                clicked = settingsController.toggleClicked(clicked);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: label,
                      ),
                      SizedBox(
                        width: fatherCons.maxWidth * 2 / 100,
                      ),
                      Icon(
                        color: ShopLightColors.primaryTextColor,
                        clicked
                            ? Icons.keyboard_arrow_down
                            : Icons.arrow_forward_ios_rounded,
                        size: clicked
                            ? fatherCons.maxWidth * 6 / 100
                            : fatherCons.maxWidth * 4 / 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: fatherCons.maxHeight * 3 / 100,
                  ),
                  if (clicked)
                    AnimatedContainer(
                      alignment: Alignment.bottomLeft,
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      child: settingChildren ?? Container(),
                    ),
                  SizedBox(
                    height: fatherCons.maxHeight * 3 / 100,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
