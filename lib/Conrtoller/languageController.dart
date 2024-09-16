import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Common/preferences.dart';

class LanguageController extends GetxController {
  Locale getLanguage() {
    final Locale shopLanguage = sharedPrefs.shopLanguage == "ar"
        ? const Locale("ar")
        : const Locale("en");

    return shopLanguage;
  }

  changeLanauage(
    String languageCode,
  ) async {
    bool languageChanged = sharedPrefs.shopLanguage != languageCode;
    if (languageChanged) {
      sharedPrefs.shopLanguage = languageCode;

      Get.updateLocale(
        Locale(languageCode),
      );
    }
  }
}
