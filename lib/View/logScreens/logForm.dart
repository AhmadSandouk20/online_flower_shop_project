import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Conrtoller/LogControllers/loginController.dart';

import '../../../Conrtoller/LogControllers/SignUpController.dart';
import '../../../Styles/colors.dart';
import '../../Styles/themes/themes.dart';
import '../../../common/custom/customTextFormField.dart';

class logForm extends StatelessWidget {
  final BuildContext context;
  final logController;
  final bool signUp;

  logForm({
    required this.context,
    required this.logController,
    required this.signUp,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // TODO FORMKEY
      // key: signUp
      //     ? SignUpController.signUpformKey
      //     : LoginController.loginFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            validate: (value) {
              logController.validateEmail(value);
            },
            label: "email".tr,
            errorMessage: logController.emailErrorMessage,
            textEditingController: logController.emailEController,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(
                logController.phoneFocusNode,
              );
            },
            textInputAction: TextInputAction.next,
          ),
          CustomTextFormField(
            label: "phoneNumber".tr,
            focusNode: logController.phoneFocusNode,
            textEditingController: logController.phoneEController,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(
                signUp
                    ? logController.userNameFocusNode
                    : logController.passwordFocusNode,
              );
            },
            keyboardType: TextInputType.number,
          ),
          if (signUp)
            CustomTextFormField(
              label: "username".tr,
              textEditingController: logController.userNameEController,
              focusNode: logController.userNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(
                  logController.passwordFocusNode,
                );
              },
              keyboardType: TextInputType.number,
            ),
          CustomTextFormField(
              label: "password".tr,
              errorMessage: logController.passwordErrorMessage,
              validate: (value) {
                logController.validatePassword(value);
              },
              textEditingController: logController.passwordEController,
              isObscure: true,
              focusNode: logController.passwordFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(
                  signUp ? logController.rePasswordFocusNode : {},
                );
              }),
          if (signUp)
            CustomTextFormField(
              label: "repassword".tr,
              isObscure: true,
              textEditingController: logController.rePasswordEController,
              focusNode: logController.rePasswordFocusNode,
            ),
          if (signUp)
            GestureDetector(
              onTap: () async {
                await logController.pickPdf();
              },
              child: Theme(
                data: ShopThemes.pdfTheme(
                  ShopLightColors.primaryColor,
                ),
                child: GetBuilder<SignUpController>(
                  builder: (
                    context,
                  ) {
                    return CustomTextFormField(
                      textEditingController: logController.pdfEController,
                      label: logController.pdfEController.text
                                  .toString()
                                  .isEmpty ||
                              logController.pdfEController.text == null
                          ? "uploadPdf".tr
                          : logController.pdfEController.text,
                      isObscure: true,
                      labelColor: true,
                      suffixIcon: 0,
                      enabled: 0,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
