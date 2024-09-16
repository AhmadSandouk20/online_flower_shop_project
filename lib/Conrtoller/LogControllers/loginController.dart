import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop/Common/language.dart';
import 'package:online_flower_shop/Common/preferences.dart';
import 'package:online_flower_shop/common/api/dioHelper.dart';
import 'package:online_flower_shop/Model/user.dart';
import 'package:online_flower_shop/common/endPoints.dart';

class LoginController extends GetxController {
  bool _tToLogin = false;
  set tryingToLogin(bool value) {
    _tToLogin = value;
    update();
  }

  bool get tryingToLogin => _tToLogin;
// TODO foRm KEY
  // static final loginFormKey = GlobalKey<FormState>();
  // get formKey => loginFormKey;

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

  // TODO duplicate

  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  String? validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return emailErrorMessage = "email is not valid";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (GetUtils.isLengthLessThan(
      password,
      8,
    )) {
      return passwordErrorMessage = "password is short";
    }
    return null;
  }

  // User? validateInputs() {
  //   bool? validated = loginFormKey.currentState?.validate();
  //   if (validated != null && !validated) {
  //     update();
  //     return null;
  //   }
  // }

  login(bodyData) async {
    var response = await DioHelper.postData(
      path: LOGIN,
      bodyData: bodyData,
      queryParameters: null,
    ).then(
      (res) {
        if (res?.statusCode == 200) {
          return res;
        }
      },
    );
    if (response != null) {
      if (response.data['success'] == true) {
        // log("me 200 and success");
        return true;
      } else {
        // log(
        //   "failCode: ${response.statusCode},failMessage: ${response.statusMessage}",
        // );
        return false;
      }
    }
  }
}
