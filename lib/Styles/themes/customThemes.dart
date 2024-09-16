import 'package:flutter/material.dart';
import 'package:online_flower_shop/Styles/colors.dart';

class Customthemes {
  Customthemes._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: 'Montserrat',
      color: ShopLightColors.primaryColor,
      fontWeight: FontWeight.w800,
    ),
  );
  static TextTheme darkTextTheme = TextTheme();
}
