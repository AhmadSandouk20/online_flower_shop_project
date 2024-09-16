import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/shop/flowerController.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/common/component/selectButton.dart';
import 'package:online_flower_shop/common/component/selectionTypes.dart';
import 'package:online_flower_shop/common/custom/ShopcolorPicker.dart';
import 'package:online_flower_shop/common/custom/customMaterialButton.dart';
import 'package:online_flower_shop/common/custom/customText.dart';

import '../../../Conrtoller/shop/homePageController.dart';
// import 'package:flex_color_picker/flex_color_picker.dart';

class FilterWidget extends StatelessWidget {
  final FlowerController controller;
  final BoxConstraints constraints;

  FilterWidget({
    super.key,
    required this.controller,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowerController>(
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(
            constraints.maxWidth * 5 / 100,
          ),
          child: LayoutBuilder(builder: (context, mainCons) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "name".tr,
                    color: ShopLightColors.primaryColor,
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                  ),
                  Wrap(
                    spacing: constraints.maxWidth * 10 / 100,
                    children: List.generate(
                      controller.flowerTypes.length,
                      (index) => SelectButton(
                        label: controller.flowerTypes[index].name,
                        onPressed: () => controller.toggleSelectedNames(
                          index,
                        ),
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        selectedBackgroundColor: ShopLightColors.primaryColor,
                        selectedTextColor: Colors.white,
                        elevation: 0,
                        radius: 10,
                        minWidth: constraints.maxWidth * 20 / 100,
                        height: constraints.maxWidth * 10 / 100,
                        fontWeight: FontWeight.w400,
                        constraints: constraints,
                        index: index,
                        selected: controller.selectedNames.contains(
                          index,
                        )
                            ? true
                            : false,
                      ),
                    ),
                  ),
                  CustomText(
                    text: "catOfFlowers".tr,
                    color: ShopLightColors.primaryColor,
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                  ),
                  Wrap(
                    spacing: constraints.maxWidth * 10 / 100,
                    children: List.generate(
                      controller.categories.length,
                      (index) => SelectButton(
                        label: controller.categories[index].name,
                        onPressed: () => controller.toggleSelectedCategories(
                          index,
                        ),
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        selectedBackgroundColor: ShopLightColors.primaryColor,
                        selectedTextColor: Colors.white,
                        elevation: 0,
                        radius: 10,
                        minWidth: constraints.maxWidth * 20 / 100,
                        height: constraints.maxWidth * 10 / 100,
                        fontWeight: FontWeight.w400,
                        constraints: constraints,
                        index: index,
                        selected: controller.selectedCategories.contains(index)
                            ? true
                            : false,
                      ),
                    ),
                  ),
                  CustomText(
                    text: "color".tr,
                    color: ShopLightColors.primaryColor,
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                  ),
                  Wrap(
                    spacing: constraints.maxWidth * 3 / 100,
                    runSpacing: constraints.maxHeight * 1 / 100,
                    children: controller.filterColors
                        .mapIndexed(
                          (
                            index,
                            color,
                          ) =>
                              ShopColorPicker(
                            fatherCons: mainCons,
                            onTap: () =>
                                controller.selectedFilterColorIndex = index,
                            selected:
                                controller.selectedFilterColorIndex == index
                                    ? true
                                    : false,
                            color: color,
                            neededBorder:
                                color == Colors.white ? Colors.grey : null,
                          ),
                        )
                        .toList(),
                  ),
                  CustomText(
                    text: "price".tr,
                    fontSize: 15.h,
                    color: ShopLightColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  Wrap(
                    spacing: constraints.maxWidth * 10 / 100,
                    children: List.generate(
                      controller.prices.length,
                      (index) => SelectButton(
                        constraints: constraints,
                        selectedBackgroundColor: ShopLightColors.primaryColor,
                        selectedTextColor: Colors.white,
                        index: index,
                        label: controller.prices[index],
                        onPressed: () => controller.selectedPriceIndex = index,
                        selected: controller.selectedPriceIndex == index
                            ? true
                            : false,
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        radius: 10,
                        minWidth: constraints.maxWidth * 20 / 100,
                        height: constraints.maxWidth * 10 / 100,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: GetBuilder<FlowerController>(
                      builder: (context) {
                        return CustomMaterialbutton(
                          buttonText: "done".tr,
                          onPressed: () async {
                            controller.resetAll(true);
                          },
                          textColor: Colors.white,
                          backgroundColor: ShopLightColors.primaryColor,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
