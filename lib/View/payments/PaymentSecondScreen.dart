import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop/Conrtoller/paymentController.dart';
import 'package:online_flower_shop/Styles/colors.dart';
import 'package:online_flower_shop/View/payments/widgets/paymentForm.dart';
import 'package:online_flower_shop/common/custom/customMaterialButton.dart';
import 'package:online_flower_shop/common/custom/customText.dart';

import '../../common/custom/customHeading.dart';

class PaymentSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.arguments;
    return Scaffold(
      body: LayoutBuilder(
        builder: (
          context,
          cons,
        ) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: cons.maxWidth * 8 / 100,
                right: cons.maxWidth * 8 / 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  CustomText(
                    text: "paymentMethod".tr,
                    color: ShopLightColors.primaryColor,
                    fontWeight: FontWeight.w100,
                    fontSize: min(cons.maxHeight, cons.maxWidth) * 4 / 100,
                  ),
                  SizedBox(
                    height: cons.maxHeight * 2 / 100,
                  ),
                  PaymentForm(
                    context: context,
                    paymentController: paymentController,
                    constraints: cons,
                    pageNumber: 2,
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
