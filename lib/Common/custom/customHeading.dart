import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Styles/colors.dart';
import '../../Styles/fonts.dart';

class CustomHeading extends StatelessWidget {
  final String headingText;
  bool backButton;
  bool isBold;
  double? spaceBetween;
  String fontFamily;

  CustomHeading({
    required this.headingText,
    this.backButton = true,
    this.isBold = true,
    this.spaceBetween,
    this.fontFamily = ShopFonts.montserrat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (backButton)
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            ),
          ),
        SizedBox(
          width: spaceBetween ?? 50.h,
        ),
        Text(
          headingText,
          style: TextStyle(
            color: ShopLightColors.primaryColor,
            fontSize: 34.w,
            fontFamily: fontFamily,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
