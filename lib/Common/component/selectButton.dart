import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_flower_shop/Styles/colors.dart';

import '../../Conrtoller/shop/flowerController.dart';
import '../custom/customMaterialButton.dart';

class SelectButton extends StatelessWidget {
  final Color backgroundColor;
  final Color? selectedBackgroundColor;
  final Color? selectedTextColor;
  final Color? selectedBorderColor;
  final BoxConstraints constraints;
  final String label;
  final dynamic Function()? onPressed;
  final bool selected;
  final Color textColor;
  final int index;
  FontWeight? fontWeight;
  double? radius;
  double? minWidth;
  double? elevation;
  double? height;

  SelectButton({
    super.key,
    required this.backgroundColor,
    required this.constraints,
    required this.label,
    required this.onPressed,
    required this.selected,
    required this.index,
    this.selectedTextColor,
    this.selectedBackgroundColor,
    this.selectedBorderColor = const Color(
      0xFF8F8F8F,
    ),
    this.height,
    this.minWidth,
    this.radius = 8,
    this.elevation = 0,
    this.fontWeight,
    this.textColor = const Color(
      0xFF8F8F8F,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return CustomMaterialbutton(
      buttonText: label,
      onPressed: onPressed,
      textColor: selected ? selectedTextColor ?? textColor : textColor,
      elevation: 0,
      backgroundColor: selected
          ? selectedBackgroundColor ?? backgroundColor
          : backgroundColor,
      minWidth: constraints.maxWidth * 2 / 100,
      borderColor: selected
          ? selectedBorderColor
          : const Color(
              0xFF8F8F8F,
            ),
      height: height ?? 45.h,
      radius: radius,
      fontWeight: fontWeight ?? FontWeight.w100,
    );
  }
}
