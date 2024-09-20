import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as DioPack;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop/constants/shopText.dart';
// import 'package:get/get.dart';

import '../../common/endPoints.dart';
import '../../Model/user.dart';
import '../../common/api/dioHelper.dart';
import '../../common/pickers/FilePicker.dart';
import '../../common/pickers/imagePicker.dart';

class SignUpController extends GetxController {
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final rePasswordFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _rePasswordEditingController =
      TextEditingController();
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _pdfEditingController = TextEditingController();
  File? pickedImage;

  File? pickedPdf;

  final RxBool _tryingSign = false.obs;

  set tryingToSign(bool value) {
    _tryingSign.value = value;
    update();
  }

  bool userDidntChooseImage = false;

  bool get userChoosedImage => userDidntChooseImage;

  set userChoosedImage(bool value) {
    userDidntChooseImage = true;
    update();
  }

  bool get tryingToSign => _tryingSign.value;

  get phoneEController => _phoneEditingController;

  get userNameEController => _userNameEditingController;

  get emailEController => _emailEditingController;

  get passwordEController => _passwordEditingController;

  get rePasswordEController => _rePasswordEditingController;

  get pdfEController {
    return _pdfEditingController;
  }

  get pickedPdfFile => pickedPdf;
// TODO FORMKEY
  static final signUpformKey = GlobalKey<FormState>();
  get formKey => signUpformKey;

  pickPdf() async {
    Map<String, dynamic>? result = await ShopFilepicker.pickFile();

    _pdfEditingController.text = result!["name"];
    //send to save
    pickedPdf = result["file"];

    update();
  }

  Future<File?> pickImage(
    source,
    signUpController,
  ) async {
    return await ShopImagePicker.pickImage(
      source,
    ).then(
      (pickedImage) {
        signUpController.profileImage = pickedImage;

        Get.back();
      },
    );
  }

  set profileImage(File? file) {
    pickedImage = file;
    update();
  }

  File? get profileImage => pickedImage;

  get signupFlower => "assets/images/SignUp/signup_flower.png";

  get uploadPdf => "assets/images/SignUp/upload_pdf_file.png";

  String emailErrorMessage = '';
  String passwordErrorMessage = '';

  Future<bool> signUp(bodyData) async {
    return await DioHelper.postData(
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      path: REGISTER,
      isFormData: true,
      bodyData: bodyData,
      queryParameters: null,
    ).then(
      (res) {
        tryingToSign = false;
        if (res != null) {
          if (res.statusCode == 200) {
            if (res.data['success'] == true) {
              log("me 200 and success");
              return true;
            } else {
              log("me 200 but not success");
              return false;
            }
          } else if (res.statusCode == 422) {
            log("me 422");
            return false;
          }
        }
        log("me response is null");
        return false;
      },
    );
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

  String? validatePasswordAndRePassMatch(
    String? password,
    String? rePassword,
  ) {
    String? emptyRes = validateEmpty(password);
    if (emptyRes != null) {
      return emptyRes;
    }
    String? passwordIsAccepted = validatePassword(password);

    if (passwordIsAccepted != null) {
      return "password must contain speial chars,...";
    }
    bool match = password == rePassword;
    return match ? null : "confirm password must match the password";
  }

  bool validateInputs() {
    log('pickedimage is $pickedImage');
    bool validated = signUpformKey.currentState!.validate();
    bool noImageSelected = pickedImage == null;

    log('noImageSelected is $noImageSelected');
    if (noImageSelected) {
      ShopText.addProfilePhoto = "You Must Choose A Photo For Your Profile";
      return false;
    }
    if (!validated) {
      return false;
    }
    return true;
  }

  Future<User> getUserInputs() async {
    return await prepareImageToUpload(
      pickedImage!,
    ).then(
      (multiPartedImage) {
        final User user = User(
          email: _emailEditingController.text,
          password: _passwordEditingController.text,
          phoneNumber: _phoneEditingController.text,
          userName: _userNameEditingController.text,
          profilePhoto: multiPartedImage,
        );
        return user;
      },
    );
  }

  Future<DioPack.MultipartFile> prepareImageToUpload(
    File image,
  ) async {
    return await DioPack.MultipartFile.fromFile(
      image.path,
      filename: image.path.split('/').last,
    );
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameFocusNode.dispose();
    rePasswordFocusNode.dispose();

    super.dispose();
  }
}
