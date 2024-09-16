import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import '../common/preferences.dart';
import '../main.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    authed = sharedPrefs.token != '' &&
            sharedPrefs.notExpiredCheck(
              sharedPrefs.tokenInitializeTime,
            )
        ? true
        : false;

    log("You are $authed atuhed");
    if (authed) {
      return const RouteSettings(
        name: "/shopMainPage",
      );
    }
    return super.redirect(
      route,
    );
  }
}
