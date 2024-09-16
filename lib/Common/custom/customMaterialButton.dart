import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Styles/fonts.dart';
import '../../../common/sizeConfig.dart';

class CustomMaterialbutton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final fontFamily;
  final fontWeight;
  Color? borderColor;
  double? fontSize;
  double? minWidth;
  double? height;
  double? radius;
  double? elevation;

  CustomMaterialbutton({
    required this.buttonText,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor,
    this.fontFamily = ShopFonts.roboto,
    this.fontWeight = FontWeight.w900,
    this.minWidth,
    this.height,
    this.fontSize,
    this.radius,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? backgroundColor,
        ),
        borderRadius: BorderRadius.circular(
          radius ?? 12.h,

          // color
        ),
      ),
      minWidth: minWidth ?? SizeConfig.screenWidth / 2,
      height: height ?? SizeConfig.screenHeight / 15,
      onPressed: onPressed,
      elevation: elevation,
      color: backgroundColor,
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 15.sp,
          color: textColor,
        ),
      ),
    );
  }
}
