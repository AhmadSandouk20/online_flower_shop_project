import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/shop/ShopMainPageController.dart';
import 'package:online_flower_shop/Conrtoller/shop/flowerController.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/Styles/fonts.dart';
import 'package:online_flower_shop/View/shop/flowers/flowersScreen.dart';
import 'package:online_flower_shop/common/sizeConfig.dart';

import '../../common/component/categoriesEnum.dart';
import '../../common/custom/customText.dart';

Future<dynamic> flowerNavigationDialog() async {
  await Get.dialog(
    Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.screenHeight * 20 / 100,
        horizontal: SizeConfig.screenWidth * 7 / 100,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        border: Border.all(
          color: ShopLightColors.lightPinkColor,
          width: 5,
        ),
      ),
      child: LayoutBuilder(
        builder: (
          context,
          cons,
        ) {
          return Row(
            children: [
              SizedBox(
                width: cons.maxWidth * 50 / 100,
                child: ListView(
                  children: [
                    for (var item in flowersScreenNavigationList)
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: cons.maxHeight * 3 / 100,
                            ),
                            child: Material(
                              color: Colors.white,
                              child: GestureDetector(
                                child: CustomText(
                                  fontFamily: ShopFonts.roboto,
                                  fontWeight: FontWeight.w500,
                                  color: ShopLightColors.primaryColor,
                                  fontSize: cons.maxHeight * 3.3 / 100,
                                  text: item['label'] as String,
                                  fatherConstrains: cons,
                                ),
                                onTap: () {
                                  Get.back();

                                  ShopMainPageController.openView(
                                    item['categoryType'] as CategoriesEnum,
                                  );
                                },
                              ),
                            ),
                          ),
                          Divider(
                            color: ShopLightColors.lightPinkColor,
                            height: cons.maxHeight * 3 / 100,
                            thickness: cons.maxHeight * 0.5 / 100,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: cons.maxHeight,
                width: cons.maxWidth * 50 / 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/shopNavigationDialog/Rose_Bouquet.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

List<Map<String, Object>> flowersScreenNavigationList = [
  {
    "label": "flowers".tr,
    "categoryType": CategoriesEnum.flowers,
  },
  {
    "label": "plants".tr,
    "categoryType": CategoriesEnum.plants,
  },
  {
    "label": "bouquet".tr,
    "categoryType": CategoriesEnum.bouquet,
  },
  {
    "label": "offers".tr,
    "categoryType": CategoriesEnum.offers,
  },
  {
    "label": "gifts".tr,
    "categoryType": CategoriesEnum.gifts,
  },
];
