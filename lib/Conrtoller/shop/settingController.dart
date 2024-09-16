import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Bindings/logBindings.dart';
import 'package:online_flower_shop/Conrtoller/LogControllers/loginController.dart';
import 'package:online_flower_shop/common/api/dioHelper.dart';

import '../../Common/preferences.dart';
import '../../common/endPoints.dart';

class SettingController extends GetxController {
  bool isDarkSwitchSelect = (sharedPrefs.viewMode == "light") ? false : true;

  toggleDarkSwitchSelect() {
    _switchTheme();
    isDarkSwitchSelect = !isDarkSwitchSelect;
    Get.changeThemeMode(
      isDarkSwitchSelect ? ThemeMode.dark : ThemeMode.light,
    );
    update();
  }

  _switchTheme() {
    sharedPrefs.viewMode = (sharedPrefs.viewMode == "light") ? "dark" : "light";
    update();
  }

  static const String ellipseImage =
      "assets/images/Settings/half_rounded_Ellipse.png";

  static const String ellipseFlowerImage =
      "assets/images/Settings/The_Holiday_Aisle.png";

  static const String bottomWhiteRoseImage =
      "assets/images/Settings/White_rose.png";

  toggleClicked(clicked) {
    clicked = !clicked;
    update();
    return clicked;
  }

  logout(String token) async {
    var response = await DioHelper.postData(
        path: LOGOUT,
        bodyData: {
          'Token': token,
        },
        queryParameters: null,
        headers: {
          "Cache-Control": "no-cache, private",
          "Access-Control-Allow-Origin": "*",
          'Vary': "Authorization",
          'Keep-Alive': "timeout=5, max=100",
          'Connection': "Keep-Alive",
          'Transfer-Encoding': "chunked",
          'Content-Type': "application/json",
        });
    if (response != null && response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
