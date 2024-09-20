import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Common/preferences.dart';
import 'package:online_flower_shop/common/endPoints.dart';
import 'package:online_flower_shop/main.dart';

import '../../common/api/dioHelper.dart';

class VerificationController extends GetxController {
  String? isEmpty(String? value) {
    if (value == null) {
      return "can't be empty";
    }
    return null;
  }

  RxBool verifiy = false.obs;
  bool get verifiying => verifiy.value;

  set verifiying(bool value) {
    verifiy.value = value;
    update();
  }

  TextEditingController pIController = TextEditingController();

  get pInputController => pIController;

  get monestra => "assets/images/Verification/Monstera.png";

  final String _email = Get.arguments['email'];
  final String _from = Get.arguments['from'];

  String get email => _email;
  String get from => _from;

  Future<bool> verifyVerficationCode(String email, String code) async {
    return await DioHelper.postData(
      queryParameters: null,
      path: VERFIY_CODE,
      bodyData: {
        "email": email,
        "verification_code": code,
      },
    ).then(
      (res) {
        if (res != null) {
          if (res.statusCode == 200) {
            if (res.data['success'] == true) {
              return true;
            }
          } else if (res.statusCode == 422) {
            log("error ocurrded $res /n");
          }
        }
        return false;
      },
    );
  }

  Future<bool> verify2FactorCode(String email, String code) async {
    return await DioHelper.postData(
      queryParameters: null,
      path: VERFIY_2_FACTOR_CODE,
      bodyData: {
        "email": email,
        "TwoFactorAuth": code,
      },
    ).then(
      (res) {
        if (res != null) {
          if (res.statusCode == 200) {
            if (res.data['success'] == true) {
              sharedPrefs.token = res.data['access_token'];
              sharedPrefs.tokenInitializeTime =
                  DateTime.now().toIso8601String();
              return true;
            }
          } else if (res.statusCode == 422) {
            log("error ocurrded $res /n");
          }
        }
        return false;
      },
    );
  }

  Future<bool> reSendVerficationCode(
    String email,
  ) async {
    log("asking for new verfication code");
    return await DioHelper.postData(
      queryParameters: null,
      path: RE_SEND_VERIFICATION_CODE,
      bodyData: {
        "email": email,
      },
    ).then(
      (res) {
        if (res != null) {
          if (res.statusCode == 200) {
            if (res.data['success'] == true) {
              return true;
            }
          } else if (res.statusCode == 422) {
            log("error ocurrded $res /n");
          }
        }
        return false;
      },
    );
  }

  Future<bool> reSend2FactorCode(
    String email,
  ) async {
    log("asking for new 2factor code");
    return await DioHelper.postData(
      queryParameters: null,
      path: RE_SEND_2FACTOR_CODE,
      bodyData: {
        "email": email,
      },
    ).then(
      (res) {
        if (res != null) {
          if (res.statusCode == 200) {
            if (res.data['success'] == true) {
              return true;
            }
          } else if (res.statusCode == 422) {
            log("error ocurrded $res /n");
          }
        }
        return false;
      },
    );
  }
}
