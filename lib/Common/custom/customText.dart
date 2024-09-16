import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_flower_shop/Styles/colors.dart';

import '../../Styles/fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  String? fontFamily;
  Color? color;
  FontWeight? fontWeight;
  BoxConstraints? fatherConstrains;
  double? fontSize;
  int? maxLines;
  TextOverflow? overflow;

  CustomText({
    required this.text,
    this.fontSize,
    this.color,
    this.fontFamily = ShopFonts.montserrat,
    this.fontWeight,
    this.fatherConstrains,
    this.maxLines = 10,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: fatherConstrains == null
            ? 0
            : fatherConstrains!.maxHeight * 5 / 100,
      ),
      child: Text(
        text,
        overflow: overflow ?? TextOverflow.visible,
        softWrap: true,
        maxLines: maxLines,
        style: TextStyle(
          color: color ?? ShopLightColors.primaryTextColor,
          fontSize: fontSize ?? 12.sp,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
