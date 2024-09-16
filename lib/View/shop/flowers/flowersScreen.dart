import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/bottomNavigationController.dart';
import 'package:online_flower_shop/Conrtoller/flowerDetailsController.dart';
import 'package:online_flower_shop/Conrtoller/shop/flowerController.dart';
import 'package:online_flower_shop/View/shop/flowers/filter.dart';
import 'package:online_flower_shop/View/shop/shopMainHeadingWidget.dart';
import 'package:online_flower_shop/View/shop/shopMainPage.dart';
import 'package:online_flower_shop/common/bottomNavigation/bottomNavigationBar.dart';

import '../../../Model/flower.dart';
import '../../../Styles/colors.dart';
import '../../../common/component/customCard.dart';
import '../../../common/component/selectButton.dart';
import '../../../common/custom/customText.dart';
import '../../../common/sizeConfig.dart';
import 'flowerDetailsScreen.dart';

class FlowersScreen extends StatelessWidget {
  const FlowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FlowerController flowerController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, fatherCons) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ShopMainHeadingWidget(),
                    CustomText(
                      text: "flowers".tr,
                      color: ShopLightColors.primaryColor,
                      fatherConstrains: fatherCons,
                      fontWeight: FontWeight.w500,
                      fontSize: min(fatherCons.maxHeight, fatherCons.maxWidth) *
                          5 /
                          100,
                    ),
                    SizedBox(
                      height: fatherCons.maxHeight * 3 / 100,
                    ),
                    // TODO uncomment
                    LayoutBuilder(
                      builder: (
                        context,
                        cons,
                      ) =>
                          GetBuilder<FlowerController>(
                        builder: (
                          context,
                        ) {
                          return Wrap(
                            spacing: cons.maxWidth * 5 / 100,
                            children: List.generate(
                              flowerController.flowerScreensList.length,
                              (
                                index,
                              ) =>
                                  SelectButton(
                                selectedBorderColor:
                                    ShopLightColors.primaryColor,
                                selectedBackgroundColor:
                                    ShopLightColors.primaryBackgroundColor,
                                selectedTextColor: Color(
                                  0xFF8F8F8F,
                                ),
                                index: index,
                                selected: flowerController.choice() &&
                                        flowerController.screenIndex == index
                                    ? true
                                    : false,
                                onPressed: () {
                                  flowerController.screenIndex = index;
                                  flowerController.showScreen(
                                    flowerController.flowerScreensList[index]
                                        ["selectionType"],
                                  );
                                },
                                label: flowerController.flowerScreensList[index]
                                    ["screenName"],
                                backgroundColor:
                                    ShopLightColors.primaryBackgroundColor,
                                constraints: cons,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    GetX<FlowerController>(
                      builder: (
                        builder,
                      ) =>
                          flowerController.isFilter.value
                              ? Expanded(
                                  child: FilterWidget(
                                    constraints: fatherCons,
                                    controller: flowerController,
                                  ),
                                )
                              : flowerController.isBestSellers.value
                                  ? Text(
                                      "bestSellers".tr,
                                    )
                                  : flowerController.isMostGifted.value
                                      ? Text(
                                          "mostGifted".tr,
                                        )
                                      : Expanded(
                                          child: LayoutBuilder(
                                            builder: (context, gridFatherCons) {
                                              List<Flower> flowersList =
                                                  flowerController.flowersList;
                                              return GridView.builder(
                                                itemCount: flowersList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio:
                                                      (gridFatherCons.maxWidth /
                                                              2) /
                                                          gridFatherCons
                                                              .maxHeight,
                                                  crossAxisSpacing:
                                                      gridFatherCons.maxWidth *
                                                          2 /
                                                          100,
                                                  mainAxisSpacing:
                                                      gridFatherCons.maxHeight *
                                                          1 /
                                                          100,
                                                ),
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                  margin: EdgeInsets.only(
                                                    left: gridFatherCons
                                                            .maxWidth *
                                                        1 /
                                                        100,
                                                    right: gridFatherCons
                                                            .maxWidth *
                                                        1 /
                                                        100,
                                                    top: gridFatherCons
                                                            .maxWidth *
                                                        3 /
                                                        100,
                                                  ),
                                                  child: flowerCard(
                                                    goToFlowerDetails: () {
                                                      Get.to(
                                                        () =>
                                                            FlowerDetailsScreen(),
                                                        binding:
                                                            BindingsBuilder.put(
                                                          () =>
                                                              FlowerDetailsController(),
                                                        ),
                                                      );
                                                    },
                                                    flowerController:
                                                        flowerController,
                                                    flowerIndex: index,
                                                    image: flowersList[index]
                                                        .imageUrl,
                                                    price: flowersList[index]
                                                        .price,
                                                    flowerName:
                                                        flowersList[index].name,

                                                    availabeColors:
                                                        flowersList[index]
                                                            .availabeColors,
                                                    selectedIndex: flowerController
                                                            .flowerSelectedColor[
                                                        index],

                                                    // onTap:()=>flowerController.setFlowerSelectedColor(index, colorIndex)
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                    ),
                  ],
                ),
              ),
              BottomNavigationBarBuilder.buildBottomNavigationBar(
                bottomController,
              ),
            ],
          );
        },
      ),
    );
  }
}
