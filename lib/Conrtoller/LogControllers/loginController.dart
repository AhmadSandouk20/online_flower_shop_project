import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop/Common/language.dart';
import 'package:online_flower_shop/Common/preferences.dart';
import 'package:online_flower_shop/common/api/dioHelper.dart';
import 'package:online_flower_shop/Model/user.dart';
import 'package:online_flower_shop/common/endPoints.dart';

import 'dart:developer';

class LoginController extends GetxController {
  bool _tToLogin = false;
  set tryingToLogin(bool value) {
    _tToLogin = value;
    update();
  }

  bool get tryingToLogin => _tToLogin;
// TODO foRm KEY
  static final loginFormKey = GlobalKey<FormState>();
  get formKey => loginFormKey;

  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();

  get phoneEController => _phoneEditingController;

  get passwordEController => _passwordEditingController;

  get emailEController => _emailEditingController;

  get bunchOrchidwithLilaWallDecal1Asset =>
      'assets/images/Login/BunchOrchidwithLilaWallDecal1.png';

  get ellipse2 => 'assets/images/Login/Ellipse_2.png';

  get bunchOrchidwithLilaWallDecal =>
      'assets/images/Login/Bunch_Orchid_with_Lila_Wall_Decal_1.png';

  get ellipse1 => 'assets/images/Login/Ellipse_1.png';

  get blueBottomLoginFlower =>
      'assets/images/Login/blue_bottom_login_flower.png';

  bool checkIfLoggeOut() {
    if (Get.arguments != null) {
      return Get.arguments["logout"];
    }
    return false;
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  String? validateEmail(String? email) {
    String? res = validateEmpty(email);
    if (res != null) {
      return res;
    } else if (!GetUtils.isEmail(email ?? '')) {
      return "email is not valid";
    }
    return null;
  }

  String? validatePassword(String? password) {
    String? res = validateEmpty(password);
    if (res != null) {
      return res;
    } else if (GetUtils.isLengthLessThan(
      password,
      8,
    )) {
      return "password is short";
    }
    return null;
  }

  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "You can't leave this field empty";
    }
    return null;
  }

  bool validateInputs() {
    bool validated = loginFormKey.currentState!.validate();

    if (validated == false) {
      return false;
    }
    return true;
  }

  Future<bool> login(bodyData) async {
    return await DioHelper.postData(
      path: LOGIN,
      bodyData: bodyData,
      queryParameters: null,
    ).then(
      (res) {
        if (res != null) {
          if (res.statusCode == 200) {
            if (res.data['success'] == true) {
              log("login me 200 and success");
              return true;
            } else {
              log("login me 200 but not success");
              return false;
            }
          } else if (res.statusCode == 422) {
            log("login me 422");
            return false;
          }
        }
        log("login me response is null");
        return false;
      },
    );
  }
}
