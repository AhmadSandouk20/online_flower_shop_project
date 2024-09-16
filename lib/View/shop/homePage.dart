import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Styles/fonts.dart';
import 'package:online_flower_shop/View/shop/shopMainHeadingWidget.dart';
import 'package:collection/collection.dart';
import 'package:online_flower_shop/common/custom/customRadius.dart';
import 'dart:math';

import '../../Conrtoller/shop/homePageController.dart';
import '../../Styles/colors.dart';
import '../../common/custom/customMaterialButton.dart';
import '../../common/custom/customText.dart';
import '../../common/sizeConfig.dart';

class HomePage extends GetView<Homepagecontroller> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShopMainHeadingWidget(
          backButton: false,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 2 / 3 -
              SizeConfig.screenHeight * 9 / 100,
          width: SizeConfig.screenWidth,
          child: GetBuilder<Homepagecontroller>(
            builder: (context) {
              return LayoutBuilder(
                builder: (
                  context,
                  mainConstraints,
                ) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: mainConstraints.maxWidth * 6 / 100,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: "welcomeMessage".tr,
                              color: ShopLightColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fatherConstrains: BoxConstraints(
                                maxHeight: mainConstraints.maxHeight * 2 / 3,
                                maxWidth: mainConstraints.maxWidth,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 15,
                            ),
                            padding: const EdgeInsets.only(
                              left: 15,
                              bottom: 15,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ShopLightColors.elipseBackgroundColor,
                                width: 8,
                              ),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            child: CustomText(
                              text: "introducingMessage".tr,
                              fatherConstrains: BoxConstraints(
                                maxHeight: mainConstraints.maxHeight * 2 / 3,
                                maxWidth: mainConstraints.maxWidth,
                              ),
                            ),
                          ),
                          CustomText(
                            text: "offers".tr,
                            color: ShopLightColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 55 / 100,
                            child: LayoutBuilder(
                              builder: (
                                context,
                                stackCons,
                              ) {
                                return InkWell(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: stackCons.maxWidth,
                                        height: stackCons.maxHeight * 95 / 100,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                              25,
                                            ),
                                            bottomRight: Radius.circular(
                                              8,
                                            ),
                                            topLeft: Radius.circular(
                                              8,
                                            ),
                                            topRight: Radius.circular(
                                              8,
                                            ),
                                          ),
                                          color: Color(
                                            0xFFFFE3D6,
                                          ).withOpacity(
                                            0.2,
                                          ),
                                          border: Border.all(
                                            width: 5,
                                            color: Color(
                                              0xFFFFE3D6,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: stackCons.maxHeight * -10 / 100,
                                        child: Image.asset(
                                          "assets/images/HomePage/Silk_Rose_Ceramic_Pot.png",
                                        ),
                                      ),
                                      Positioned(
                                        bottom: stackCons.maxHeight * 35 / 100,
                                        child: CustomText(
                                          fontSize: 20.sp,
                                          text: "Happy Mothers Day",
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: stackCons.maxHeight * 10 / 100,
                                        child: SizedBox(
                                          width: stackCons.maxWidth * 60 / 100,
                                          child: CustomText(
                                            text:
                                                "On this special Occasion get 50% discount on the Artificial Silk Roses",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 2 / 100,
                          ),
                          CustomText(
                            text: "bestSellers".tr,
                            color: ShopLightColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 3 / 100,
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 65 / 100,
                            width: mainConstraints.maxWidth,
                            child: LayoutBuilder(
                              builder: (context, gridFatherCons) => flowerGrid(
                                gridFatherCons: gridFatherCons,
                                controller: controller,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 5 / 100,
                            width: mainConstraints.maxWidth,
                          ),
                          CustomText(
                            text: "customizeSpecialGifts".tr,
                            color: ShopLightColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 2 / 100,
                            width: mainConstraints.maxWidth,
                          ),
                          specialGift(
                            mainConstraints,
                          ),
                          SizedBox(
                            height: mainConstraints.maxHeight * 5 / 100,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget customColorContainer({
  required BoxConstraints constraints,
  required Color color,
  required selected,
}) {
  return Container(
    width: min(
          constraints.maxHeight,
          constraints.maxWidth,
        ) *
        15 /
        100,
    height: min(
          constraints.maxHeight,
          constraints.maxWidth,
        ) *
        15 /
        100,
    decoration: const BoxDecoration(
      color: ShopLightColors.primaryTextColor,
      shape: BoxShape.circle,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: min(
            constraints.maxHeight,
            constraints.maxWidth,
          ) *
          10 /
          100,
      height: min(
            constraints.maxHeight,
            constraints.maxWidth,
          ) *
          10 /
          100,
    ),
  );
}

Widget flowerGrid({
  required controller,
  required gridFatherCons,
}) {
  return GridView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: controller.bestSellersFlowers.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio:
          (gridFatherCons.maxWidth / 1.7) / (gridFatherCons.maxHeight / 3),
      mainAxisSpacing: gridFatherCons.maxHeight * 4 / 100,
    ),
    itemBuilder: (
      context,
      index,
    ) =>
        LayoutBuilder(
      builder: (
        context,
        cardCons,
      ) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: CustomRadius.bottomLeftRadius(),
          ),
          elevation: 10,
          shadowColor: Colors.grey,
          color: ShopLightColors.primaryBackgroundColor,
          child: Container(
            margin: EdgeInsets.only(
              top: gridFatherCons.maxHeight * 4 / 100,
              left: gridFatherCons.maxWidth * 6 / 100,
              right: gridFatherCons.maxWidth * 6 / 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: gridFatherCons.maxWidth * 90 / 100,
                  height: gridFatherCons.maxHeight * 40 / 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      controller.bestSellersFlowers[index].imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: gridFatherCons.maxHeight * 2.5 / 100,
                ),
                SizedBox(
                  height: gridFatherCons.maxHeight * 15 / 100,
                  child: CustomText(
                    text: controller.bestSellersFlowers[index].name,
                    color: ShopLightColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: cardCons.maxHeight * 2 / 100,
                ),
                SizedBox(
                  height: gridFatherCons.maxHeight * 10 / 100,
                  child: CustomText(
                    text:
                        " ${"price:".tr} ${controller.bestSellersFlowers[index].price}",
                    color: ShopLightColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: ShopFonts.roboto,
                  ),
                ),
                SizedBox(
                  height: cardCons.maxHeight * 4 / 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomMaterialbutton(
                    buttonText: "addToCart".tr,
                    onPressed: () {},
                    textColor: ShopLightColors.primaryColor,
                    backgroundColor: ShopLightColors.elipseBackgroundColor,
                    minWidth: gridFatherCons.maxWidth * 25 / 100,
                    height: gridFatherCons.maxHeight * 15 / 100,
                    fontSize: gridFatherCons.maxHeight * 4.5 / 100,
                    radius: 3,
                    fontWeight: FontWeight.w500,
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget specialGift(mainConstraints) {
  return SizedBox(
    height: mainConstraints.maxHeight * 48 / 100,
    child: LayoutBuilder(
      builder: (
        context,
        rowCons,
      ) {
        return Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: rowCons.maxHeight * 1 / 100,
                  left: rowCons.maxWidth * 25 / 100,
                ),
                width: rowCons.maxWidth * 55 / 100,
                height: rowCons.maxHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Color(
                      0xFF9E9289,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      12,
                    ),
                    bottomRight: Radius.circular(
                      12,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    // TODO change to custom text
                    Text(
                      "Love Box",
                      style: TextStyle(
                        color: Color(
                          0xFFF6E1D8,
                        ),
                        fontWeight: FontWeight.w900,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                    ),
                    SizedBox(
                      height: rowCons.maxHeight * 5 / 100,
                    ),
                    // TODO change to custom text
                    Text(
                      "Check Out The Special flower arrangement with a luxurious chocolate box",
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Color(
                          0xFF707070,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: SizedBox(
                height: rowCons.maxHeight,
                width: rowCons.maxWidth * 65 / 100,
                child: Card(
                  margin: EdgeInsets.zero,
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
                  ),
                  elevation: 5,
                  child: Image.asset(
                    "assets/images/HomePage/Pink_Box_Flowers_with_chocolates.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
