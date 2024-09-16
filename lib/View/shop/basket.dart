import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/paymentController.dart';
import 'package:online_flower_shop/Conrtoller/shop/basketController.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/Styles/fonts.dart';
import 'package:online_flower_shop/View/payments/PaymentFirstScreen.dart';
import 'package:online_flower_shop/View/shop/shopMainPage.dart';
import 'package:online_flower_shop/common/custom/customMaterialButton.dart';
import 'package:online_flower_shop/common/custom/customText.dart';
import 'package:online_flower_shop/common/sizeConfig.dart';

import '../../common/component/cartListTile.dart';
import '../../common/custom/customHeading.dart';

class ShoppingBasket extends StatelessWidget {
  ShoppingBasket({super.key});
  final BasketController basketController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight - SizeConfig.screenHeight * 9 / 100,
      width: SizeConfig.screenWidth,
      child: LayoutBuilder(
        builder: (context, mainConstraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mainConstraints.maxHeight * 28 / 100,
                  child: LayoutBuilder(
                    builder: (
                      context,
                      headingStackConstraints,
                    ) {
                      return Stack(
                        children: [
                          Positioned(
                            top: headingStackConstraints.maxHeight * 45 / 100,
                            child: CustomHeading(
                              spaceBetween:
                                  headingStackConstraints.maxWidth * 1.5 / 100,
                              isBold: true,
                              headingText: "cart".tr,
                            ),
                          ),
                          Positioned(
                            width: headingStackConstraints.maxWidth * 45 / 100,
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/Cart/Ellipse_33.png",
                            ),
                          ),
                          Positioned(
                            width: headingStackConstraints.maxWidth * 45 / 100,
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/Cart/cartFlower.png",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: mainConstraints.maxHeight -
                      mainConstraints.maxHeight * 28 / 100,
                  margin: EdgeInsets.only(
                    left: mainConstraints.maxHeight * 3 / 100,
                    right: mainConstraints.maxHeight * 7 / 100,
                  ),
                  child: LayoutBuilder(
                    builder: (
                      context,
                      secondPartCons,
                    ) {
                      return GetBuilder<BasketController>(builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cartListTile(
                                index: 0,
                                name: "Phalaenopsis White Orchid Steam   ",
                                listCons: secondPartCons,
                              ),
                              cartListTile(
                                index: 1,
                                name: "Aloe Vera Barbadensis Miller ",
                                listCons: secondPartCons,
                              ),
                              const Divider(
                                color: ShopLightColors.primaryColor,
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              CustomText(
                                text:
                                    "${"address".tr} Dummar street A bulding number 25 ",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {},
                                  child: CustomText(
                                    text: "changeAddress".tr,
                                    color: ShopLightColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  color: ShopLightColors.lightGreyColor,
                                ),
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              CustomText(
                                text: "${"expectedDate".tr}  june/26/2024 ",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              CustomText(
                                text: "${"expectedTime".tr} 2:30 PM ",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  color: ShopLightColors.lightGreyColor,
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: CustomText(
                                    text: "scheduleSendTime".tr,
                                    color: ShopLightColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              CustomText(
                                text: "${"delivery".tr} 20",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              CustomText(
                                text: "${"taxes".tr} 20",
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: secondPartCons.maxHeight * 2 / 100,
                              ),
                              CustomText(
                                text:
                                    "${"totalPrice".tr} ${basketController.totalPrice}",
                                fontWeight: FontWeight.w500,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: mainConstraints.maxHeight * 5 / 100,
                                    bottom: mainConstraints.maxHeight * 3 / 100,
                                  ),
                                  child: CustomMaterialbutton(
                                    buttonText: "continue".tr,
                                    onPressed: () => Get.to(
                                      () => PaymentFirstScreen(),
                                      binding: BindingsBuilder.put(
                                        () => PaymentController(),
                                      ),
                                    ),
                                    textColor: ShopLightColors.primaryColor,
                                    backgroundColor:
                                        ShopLightColors.elipseBackgroundColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
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
