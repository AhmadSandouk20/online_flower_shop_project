import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/paymentController.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/View/payments/PaymentSecondScreen.dart';
import 'package:online_flower_shop/View/payments/widgets/paymentForm.dart';
import 'package:online_flower_shop/common/custom/customHeading.dart';
import 'package:online_flower_shop/common/custom/customMaterialButton.dart';
import 'package:online_flower_shop/common/sizeConfig.dart';

class PaymentFirstScreen extends StatelessWidget {
  PaymentController paymentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, cons) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: cons.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: cons.maxHeight * 5 / 100,
                  ),
                  CustomHeading(
                    isBold: false,
                    headingText: "payment".tr,
                  ),
                  SizedBox(
                    height: cons.maxHeight * 5 / 100,
                  ),
                  PaymentForm(
                    pageNumber: 1,
                    context: context,
                    paymentController: paymentController,
                  ),
                  SizedBox(
                    height: cons.maxHeight * 3 / 100,
                  ),
                  CustomMaterialbutton(
                    buttonText: "location".tr,
                    onPressed: () {},
                    textColor: ShopLightColors.primaryColor,
                    backgroundColor: ShopLightColors.elipseBackgroundColor,
                    minWidth: cons.maxWidth * 60 / 100,
                    radius: 6,
                  ),
                  SizedBox(
                    height: cons.maxHeight * 5 / 100,
                  ),
                  CustomMaterialbutton(
                    buttonText: "continue".tr,
                    onPressed: () {
                      // TODO validate all fields have data before, if not then don't allow to navigate
                      Get.to(
                        () => PaymentSecondScreen(),
                        arguments: paymentController,
                      );
                    },
                    textColor: Colors.white,
                    backgroundColor: ShopLightColors.primaryColor,
                    radius: 6,
                  ),
                  Image.asset(
                    paymentController.roseImage,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
