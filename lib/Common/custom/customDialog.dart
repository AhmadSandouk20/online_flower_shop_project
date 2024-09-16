import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/common/custom/customText.dart';
import 'package:online_flower_shop/common/sizeConfig.dart';

class CustomDialog {
  static Future popUpDialog({
    required String title,
    required bool problemTitle,
    required String message,
    required Widget confirmWidget,
    Widget? cancelWdiget,
  }) async {
    await Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        color: problemTitle ? Colors.red : ShopLightColors.primaryTextColor,
      ),
      content: SizedBox(
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: CustomText(
                text: message,
                fatherConstrains: const BoxConstraints(
                  maxWidth: 0,
                  maxHeight: 0,
                ),
              ),
            ),
            // SizedBox(height:,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                confirmWidget,
                if (cancelWdiget != null) cancelWdiget,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
