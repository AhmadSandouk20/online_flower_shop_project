import 'dart:developer';

import 'package:online_flower_shop/constants/shopText.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:online_flower_shop/View/logScreens/login/loginScreen.dart';
import '../../../Bindings/shopMainPageBindings.dart';
import '../../../common/sizeConfig.dart';
import '../../../Conrtoller/LogControllers/VerificationController.dart';
import '../../../Styles/colors.dart';
import '../../../common/custom/customMaterialButton.dart';
import '../../../common/custom/customText.dart';
import '../../../View/shop/shopMainPage.dart';
import '../../../View/logScreens/clipers/verificationCliper.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerificationController verificationController =
        Get.find<VerificationController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 45 / 100,
              width: SizeConfig.screenWidth,
              child: LayoutBuilder(
                builder: (context, constarins) {
                  return ClipPath(
                    clipper: Verificationcliper(),
                    child: Container(
                      width: constarins.maxWidth,
                      color: ShopLightColors.primaryBackgroundColor,
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.only(
                              left: constarins.maxWidth / 7,
                            ),
                            alignment: Alignment.center,
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 30.sp,
                            ),
                          ),
                          SizedBox(
                            child: Center(
                              child: Image.asset(
                                verificationController.monestra,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 65 / 100,
              width: SizeConfig.screenWidth,
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Column(
                    children: [
                      CustomText(
                        fatherConstrains: constrains,
                        text: ShopText.verficationCode,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 36.w,
                        ),
                        child: CustomText(
                          fatherConstrains: constrains,
                          text: ShopText.enterCodeMessage,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40.w,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                EdgeInsets.zero,
                              ),
                            ),
                            onPressed: () async {
                              log("i am from ${verificationController.from}");
                              if (verificationController.from == "signup") {
                                await verificationController
                                    .reSendVerficationCode(
                                  verificationController.email,
                                );
                              } else if (verificationController.from ==
                                  "login") {
                                await verificationController.reSend2FactorCode(
                                  verificationController.email,
                                );
                              }
                            },
                            child: GetBuilder<VerificationController>(
                              builder: (cond) =>
                                  verificationController.verifiying
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          ShopText.reSendCode,
                                        ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 34.w,
                          vertical: 15.h,
                        ),
                        child: Column(
                          children: [
                            Pinput(
                              controller: verificationController.pIController,
                              autofocus: true,
                              closeKeyboardWhenCompleted: true,
                              keyboardType: TextInputType.name,
                              length: 6,
                              obscureText: true,
                              obscuringCharacter: '*',
                              defaultPinTheme: PinTheme(
                                textStyle: TextStyle(
                                  fontSize: 22.w,
                                ),
                                width: constrains.maxWidth,
                                height: constrains.maxHeight / 20,
                              ),
                              onSubmitted: (verficationValue) {
                                log('verfication code is $verficationValue');
                                verificationController.pIController.text =
                                    verficationValue;
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            cusror(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40.w,
                        ),
                        child: CustomText(
                          fatherConstrains: constrains,
                          text: ShopText.verificationCodeContent,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      GetBuilder<VerificationController>(
                        builder: (cont) => buttonOrIndicator(
                          context,
                          verificationController.verifiying,
                          verificationController,
                          constrains,
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

cusror() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      underPinContainer(),
      underPinContainer(),
      underPinContainer(),
      underPinContainer(),
      underPinContainer(),
      underPinContainer(),
    ],
  );
}

underPinContainer() {
  return Container(
    width: 40.w,
    height: 2.h,
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(
        8,
      ),
    ),
  );
}

Widget buttonOrIndicator(
  BuildContext context,
  bool trying,
  verificationController,
  BoxConstraints constrains,
) {
  return trying
      ? const CircularProgressIndicator()
      : CustomMaterialbutton(
          backgroundColor: ShopLightColors.elipseBackgroundColor,
          textColor: ShopLightColors.primaryColor,
          minWidth: constrains.maxWidth * 65 / 100,
          buttonText: ShopText.submit,
          onPressed: () async {
            log("email is ${verificationController.email} and code is ${verificationController.pIController.text.trim()}");
            // TODO here
            late bool success;
            if (verificationController.from == "signup") {
              success = await verificationController.verifyVerficationCode(
                verificationController.email,
                verificationController.pIController.text.trim(),
              );
              if (success) {
                verificationController.pIController.clear();
                Get.to(
                  () => const LoginScreen(),
                );
              }
            } else if (verificationController.from == "login") {
              success = await verificationController.verify2FactorCode(
                verificationController.email,
                verificationController.pIController.text.trim(),
              );
              if (success) {
                Get.to(
                  () => ShopMainPage(),
                  binding: ShopMainPageBindings(),
                );
              }
            }
          },
        );
}
