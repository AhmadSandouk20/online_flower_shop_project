import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../Conrtoller/shop/flowerController.dart';
import '../../Styles/colors.dart';

import '../../common/custom/customMaterialButton.dart';
import '../../common/custom/customText.dart';

Widget flowerCard({
  Color shadowColor = ShopLightColors.primaryColor,
  required String image,
  required int price,
  required String flowerName,
  flowerNameColor,
  String buttonText = "addToCart",
  Color buttonTextColor = ShopLightColors.primaryColor,
  Color buttonBackgroundColor = ShopLightColors.lightPinkColor,
  required List<Color> availabeColors,
  required int selectedIndex,
  required FlowerController flowerController,
  required int flowerIndex,
  required void Function() goToFlowerDetails,
}) {
  return LayoutBuilder(
    builder: (
      context,
      cons,
    ) {
      return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              40,
            ),
            bottomRight: Radius.circular(
              12,
            ),
            topLeft: Radius.circular(
              12,
            ),
            topRight: Radius.circular(
              12,
            ),
          ),
          side: BorderSide(
            color: ShopLightColors.primaryColor,
          ),
        ),
        elevation: 5,
        shadowColor: shadowColor,
        color: ShopLightColors.primaryBackgroundColor,
        child: Container(
          margin: EdgeInsets.only(
            top: cons.maxHeight * 1 / 100,
            left: cons.maxWidth * 2 / 100,
            right: cons.maxWidth * 2 / 100,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(
                  cons.maxHeight * 2 / 100,
                ),
                width: cons.maxWidth * 90 / 100,
                height: cons.maxHeight * 60 / 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: goToFlowerDetails,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: cons.maxHeight * 1 / 100,
              ),
              SizedBox(
                height: cons.maxHeight * 7 / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: availabeColors
                      .map(
                        (
                          color,
                        ) =>
                            buildColorChoiceStack(
                          cons,
                          selected: selectedIndex ==
                                  availabeColors.indexOf(
                                    color,
                                  )
                              ? true
                              : false,
                          color: color,
                          onTap: () => flowerController.setFlowerSelectedColor(
                            flowerIndex,
                            availabeColors.indexOf(
                              color,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  // TODO callback function
                ),
              ),
              SizedBox(
                height: cons.maxHeight * 1 / 100,
              ),
              SizedBox(
                height: cons.maxHeight * 4 / 100,
                child: CustomText(
                  text: flowerName,
                  color: ShopLightColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: cons.maxHeight * 2 / 100,
              ),
              SizedBox(
                height: cons.maxHeight * 5 / 100,
                child: CustomText(
                  text: "${"price".tr} $price",
                  color: ShopLightColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomMaterialbutton(
                buttonText: buttonText.tr,
                onPressed: () {},
                textColor: buttonTextColor,
                backgroundColor: buttonBackgroundColor,
                minWidth: cons.maxWidth * 25 / 100,
                height: cons.maxHeight * 10 / 100,
                fontSize: cons.maxWidth * 7 / 100,
                radius: 3,
                fontWeight: FontWeight.w100,
                elevation: 0,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildColorChoiceStack(
  BoxConstraints cons, {
  required Color color,
  required bool selected,
  required onTap,
}) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      if (selected)
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ShopLightColors.primaryColor,
          ),
          width: min(cons.maxHeight, cons.maxWidth) * 14 / 100,
          height: min(cons.maxHeight, cons.maxWidth) * 14 / 100,
        ),
      if (selected)
        Container(
          width: min(cons.maxHeight, cons.maxWidth) * 13 / 100,
          height: min(cons.maxHeight, cons.maxWidth) * 13 / 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ShopLightColors.primaryBackgroundColor,
          ),
        ),
      Container(
        width: min(cons.maxHeight, cons.maxWidth) * 11 / 100,
        height: min(cons.maxHeight, cons.maxWidth) * 11 / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
      // TODO click(inkwell)
      InkWell(
        onTap: onTap,
        child: Container(
          width: min(cons.maxHeight, cons.maxWidth) * 10 / 100,
          height: min(cons.maxHeight, cons.maxWidth) * 10 / 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
      SizedBox(
        width: cons.maxWidth * 15 / 100,
      ),
    ],
  );
}
