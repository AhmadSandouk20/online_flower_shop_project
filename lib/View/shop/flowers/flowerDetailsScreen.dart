import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

import 'package:online_flower_shop/Conrtoller/flowerDetailsController.dart';
import 'package:online_flower_shop/Conrtoller/shop/ShopMainPageController.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/Styles/fonts.dart';
import 'package:online_flower_shop/common/bottomNavigation/bottomNavigationBar.dart';
import 'package:online_flower_shop/common/custom/customMaterialButton.dart';
import 'package:online_flower_shop/common/custom/customText.dart';
import 'package:online_flower_shop/common/custom/customTextFormField.dart';

import '../../../common/sizeConfig.dart';
import '../shopMainHeadingWidget.dart';
import '../shopMainPage.dart';

class FlowerDetailsScreen extends StatelessWidget {
  FlowerDetailsController flowerDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ShopMainHeadingWidget(
            backButton: true,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (
                context,
                listCons,
              ) {
                return ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: listCons.maxWidth * 5 / 100,
                        right: listCons.maxWidth * 7 / 100,
                        top: listCons.maxHeight * 3 / 100,
                        bottom: listCons.maxHeight * 1 / 100,
                      ),
                      height: SizeConfig.screenHeight * 25 / 100,
                      child: LayoutBuilder(
                        builder: (
                          context,
                          cons,
                        ) {
                          return Container(
                            padding: EdgeInsets.only(
                              right: cons.maxWidth * 2 / 100,
                              left: cons.maxWidth * 2 / 100,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ShopLightColors.primaryColor,
                                width: 2.h,
                              ),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            child: SizedBox(
                              width: listCons.maxWidth,
                              height: listCons.maxHeight * 5 / 100,
                              child: Row(
                                children: [
                                  Image.asset(
                                    flowerDetailsController
                                        .flowerDetails.imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                  Expanded(
                                    child: LayoutBuilder(
                                      builder: (
                                        context,
                                        columnConss,
                                      ) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: flowerDetailsController
                                                  .flowerDetails.name,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  ShopLightColors.primaryColor,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: columnConss.maxHeight *
                                                    15 /
                                                    100,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ShopLightColors
                                                    .primaryBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  8,
                                                ),
                                              ),
                                              padding: EdgeInsets.all(
                                                columnConss.maxWidth * 10 / 100,
                                              ),
                                              child: CustomText(
                                                fontSize: 15.h,
                                                text:
                                                    "${"price".tr} ${flowerDetailsController.flowerDetails.price}",
                                                color: ShopLightColors
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    detailsItemContainer(
                      cons: listCons,
                      child: CustomText(
                        text: "color".tr,
                        color: ShopLightColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.h,
                      ),
                    ),
                    SizedBox(
                      height: listCons.maxHeight * 25 / 100,
                      width: listCons.maxWidth,
                      child: LayoutBuilder(
                        builder: (
                          context,
                          cons,
                        ) {
                          return detailsItemContainer(
                            cons: listCons,
                            child: GetBuilder<FlowerDetailsController>(
                              builder: (context) {
                                return ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: flowerDetailsController
                                      .flowerDetails.availabeColors
                                      .mapIndexed(
                                        (
                                          index,
                                          color,
                                        ) =>
                                            availableColorsPreviewImagesWrapBuilder(
                                          onTap: () => flowerDetailsController
                                              .selectedColorIndex = index,
                                          imageUrl: flowerDetailsController
                                                  .availableColorsPreviewImages[
                                              index],
                                          selected: flowerDetailsController
                                                      .selectedColorIndex ==
                                                  index
                                              ? true
                                              : false,
                                          cons: cons,
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    contentDivider(
                      listCons,
                    ),
                    detailsItemContainer(
                      cons: listCons,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "flowerInfo".tr,
                            color: ShopLightColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.h,
                          ),
                          SizedBox(
                            height: listCons.maxHeight * 2 / 100,
                          ),
                          CustomText(
                            text: flowerDetailsController
                                .flowerDetails.inforamtion
                                .toString(),
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: ShopFonts.roboto,
                          ),
                        ],
                      ),
                    ),
                    contentDivider(
                      listCons,
                    ),
                    detailsItemContainer(
                      cons: listCons,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "takeCareOfPlant".tr,
                            color: ShopLightColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.h,
                          ),
                          SizedBox(
                            height: listCons.maxHeight * 2 / 100,
                          ),
                          CustomText(
                            text: flowerDetailsController
                                .flowerDetails.takeCareInstructions
                                .toString(),
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: ShopFonts.roboto,
                          ),
                        ],
                      ),
                    ),
                    contentDivider(
                      listCons,
                    ),
                    detailsItemContainer(
                      cons: listCons,
                      child: Row(
                        children: [
                          CustomMaterialbutton(
                            buttonText: "addToBasket".tr,
                            fontSize: 12.sp,
                            onPressed: () {},
                            textColor: ShopLightColors.primaryColor,
                            backgroundColor:
                                ShopLightColors.primaryBackgroundColor,
                            minWidth: SizeConfig.screenWidth * 40 / 100,
                            height: 45.h,
                          ),
                          const Spacer(),
                          CustomMaterialbutton(
                            buttonText: "buyNow".tr,
                            onPressed: () {},
                            minWidth: SizeConfig.screenWidth * 40 / 100,
                            textColor: ShopLightColors.primaryColor,
                            backgroundColor: ShopLightColors.lightPinkColor,
                            height: 45.h,
                          ),
                        ],
                      ),
                    ),
                    contentDivider(
                      listCons,
                    ),
                    detailsItemContainer(
                      child: CustomText(
                        text: "reviews".tr,
                        fontWeight: FontWeight.w500,
                        color: ShopLightColors.primaryColor,
                        fontSize: 15.h,
                      ),
                      cons: listCons,
                    ),
                    detailsItemContainer(
                      child: Divider(
                        color: const Color(
                          0xFFE5F5F5,
                        ),
                        thickness: listCons.maxHeight * 0.005,
                        height: listCons.maxHeight * 5 / 100,
                      ),
                      cons: listCons,
                    ),
                    detailsItemContainer(
                      cons: listCons,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int index = 0;
                              index <
                                  flowerDetailsController
                                      .flowerDetails.reviwes!.length;
                              index++,)
                            SizedBox(
                              width: listCons.maxWidth,
                              height: listCons.maxHeight * 50 / 100,
                              child: LayoutBuilder(
                                builder: (
                                  context,
                                  columnCons,
                                ) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: columnCons.maxWidth,
                                        height: columnCons.maxHeight * 15 / 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            CustomText(
                                              text: flowerDetailsController
                                                  .flowerDetails
                                                  .reviwes![index]
                                                  .reviewrUserName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontFamily: ShopFonts.roboto,
                                              fontSize: 15.h,
                                            ),
                                            CustomText(
                                              text: flowerDetailsController
                                                  .flowerDetails
                                                  .reviwes![index]
                                                  .dateOfReview,
                                              fontFamily: ShopFonts.roboto,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.h,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: columnCons.maxWidth,
                                        height: columnCons.maxHeight * 35 / 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                text: flowerDetailsController
                                                    .flowerDetails
                                                    .reviwes![index]
                                                    .comment,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: ShopFonts.roboto,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.h,
                                              ),
                                            ),
                                            SizedBox(
                                              height: columnCons.maxHeight *
                                                  5 /
                                                  100,
                                            ),
                                            GetBuilder<FlowerDetailsController>(
                                              builder: (context) {
                                                return StarRating(
                                                  allowHalfRating: false,
                                                  rating:
                                                      flowerDetailsController
                                                          .flowerDetails
                                                          .reviwes![index]
                                                          .reviewDegree
                                                          .toDouble(),
                                                  onRatingChanged: (degree) =>
                                                      flowerDetailsController
                                                          .changeRatingDegree(
                                                    index,
                                                    degree,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: const Color(
                                            0xFFE5F5F5,
                                          ),
                                          thickness:
                                              columnCons.maxHeight * 0.04,
                                          // height: columnCons.maxHeight * 15 / 100,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          TextField(
                            controller:
                                flowerDetailsController.commentController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: listCons.maxHeight * 8 / 100,
                                left: listCons.maxWidth * 6 / 100,
                              ),
                              label: Text(
                                "addComment".tr,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          BottomNavigationBarBuilder.buildBottomNavigationBar(
            bottomController,
          ),
        ],
      ),
    );
  }
}

contentDivider(cons) {
  return Container(
    margin: EdgeInsets.zero,
    child: Divider(
      color: const Color(
        0xFFF3E9F5,
      ),
      thickness: cons.maxHeight * 0.008,
      height: cons.maxHeight * 0.07,
    ),
  );
}

detailsItemContainer({
  required Widget child,
  required cons,
}) {
  return Container(
    margin: EdgeInsets.only(
      left: cons.maxWidth * 5 / 100,
      right: cons.maxWidth * 7 / 100,
      top: cons.maxHeight * 1 / 100,
      bottom: cons.maxHeight * 1 / 100,
    ),
    child: child,
  );
}

Widget availableColorsPreviewImagesWrapBuilder({
  required onTap,
  required imageUrl,
  required selected,
  required BoxConstraints cons,
}) {
  return SizedBox(
    width: cons.maxWidth * 30 / 100,
    height: cons.maxHeight,
    child: Container(
      padding: EdgeInsets.all(
        10.h,
      ),
      margin: EdgeInsets.only(
        bottom: cons.maxHeight * 2 / 100,
      ),
      width: cons.maxWidth * 35 / 100,
      height: cons.maxWidth * 40 / 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: selected ? ShopLightColors.primaryColor : Colors.white,
          width: SizeConfig.screenHeight * 0.005,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              // bottom: cons.maxWidth * 5 / 100,
              child: Container(
                height: cons.maxHeight * 50 / 100,
                width: cons.maxWidth * 40 / 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: ShopLightColors.lightGreyColor,
                ),
              ),
            ),
            Image.asset(
              imageUrl,
            ),
            Positioned(
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: CustomText(
                  fontFamily: ShopFonts.roboto,
                  fontWeight: FontWeight.w500,
                  color: ShopLightColors.primaryColor,
                  text: "White",
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
