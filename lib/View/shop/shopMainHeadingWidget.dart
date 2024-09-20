import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Common/custom/customText.dart';
import 'package:online_flower_shop/Conrtoller/shop/ShopMainPageController.dart';
import 'package:online_flower_shop/Conrtoller/shop/flowerController.dart';
import 'package:online_flower_shop/Conrtoller/shop/homePageController.dart';
import 'package:online_flower_shop/View/shop/flowers/flowerDetailsScreen.dart';

import '../../Conrtoller/flowerDetailsController.dart';
import '../../Styles/colors.dart';
import '../../common/component/selectionTypes.dart';
import '../../common/custom/customTextFormField.dart';
import '../../common/sizeConfig.dart';

class ShopMainHeadingWidget extends StatelessWidget {
  final BoxConstraints? cons;
  final bool backButton;
  ShopMainHeadingWidget({
    this.cons,
    this.backButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: cons != null ? cons!.maxHeight / 3 : SizeConfig.screenHeight / 3,
      decoration: const BoxDecoration(
        color: ShopLightColors.primaryBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            70,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          return Padding(
            padding: EdgeInsets.all(
              20.w,
            ),
            child: Column(
              children: [
                // TODO here
                SizedBox(
                  height: constraints.maxHeight / 10,
                ),
                Row(
                  children: [
                    if (backButton)
                      InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                      ),
                    SizedBox(
                      width: constraints.maxWidth / 10,
                    ),
                    Image.asset(
                      ShopMainPageController().shopMainHeadingImage,
                    ),
                    CustomText(
                      text: "logo".tr,
                      fontSize: 54.sp,
                    ),
                  ],
                ),
                CustomTextFormField(
                  validate: null,
                  label: "search".tr,
                  suffixIcon: 1,
                  textEditingController: TextEditingController(),
                ),
                InkWell(
                  onTap: () async {
                    await ShopMainPageController.openCategoriesDialog();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 5,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        "assets/images/HomePage/categories.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
