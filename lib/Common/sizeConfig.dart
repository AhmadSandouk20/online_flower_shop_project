import 'package:flutter/material.dart';
import 'dart:developer';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double screenHeightHundredPercent;
  static late double screenWidthHundredPercent;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    screenHeightHundredPercent = _mediaQueryData.size.height / 100;
    screenWidthHundredPercent = _mediaQueryData.size.width / 100;
    orientation = _mediaQueryData.orientation;
    log("height is $screenHeight");
    log("width is $screenWidth");
  }
}
