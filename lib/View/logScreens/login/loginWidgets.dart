import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Bindings/shopMainPageBindings.dart';
import 'package:online_flower_shop/Conrtoller/LogControllers/loginController.dart';
import 'package:online_flower_shop/constants/shopText.dart';

import '../../../Bindings/signUpBindings.dart';
import '../../../Conrtoller/LogControllers/VerificationController.dart';
import '../../../Conrtoller/shop/ShopMainPageController.dart';
import '../../../common/sizeConfig.dart';
import '../../../Styles/colors.dart';
import '../../../Styles/fonts.dart';
import '../../../common/custom/customMaterialButton.dart';
import '../../../View/logScreens/logForm.dart';
import '../../../View/logScreens/signUp/signUp.dart';
import '../verification/verificationScreen.dart';

Widget middle({
  required context,
  required controller,
  required signUp,
}) {
  return Positioned(
    top: 180.h,
    bottom: 0,
    right: 0,
    left: 0,
    child: SizedBox(
      // height: SizeConfig.screenHeight * 2 / 3,
      width: SizeConfig.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logForm(
              context: context,
              logController: controller,
              signUp: signUp,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "lessThan8".tr,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "forgetPassword".tr,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.red,
                  fontFamily: ShopFonts.roboto,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () => Get.to(
                () => const SignUpScreen(),
                binding: Signupbindings(),
              ),
              child: Text.rich(
                style: TextStyle(
                  fontFamily: ShopFonts.roboto,
                  decoration: TextDecoration.underline,
                  decorationColor: ShopLightColors.primaryColor,
                  fontSize: 14.sp,
                ),
                TextSpan(
                  text: "noAccount".tr,
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'signUp'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ShopLightColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GetBuilder<LoginController>(
              builder: (con) {
                return buttonOrIndicator(
                  trying: controller.tryingToLogin,
                  controller: controller,
                );
              },
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buttonOrIndicator({
  required bool trying,
  required controller,
}) {
  return trying
      ? const CircularProgressIndicator()
      : CustomMaterialbutton(
          onPressed: () async {
            controller.tryingToLogin = true;
            await controller.login({
              "identifier": controller.emailEController.text,
              "password": controller.passwordEController.text,
            }).then(
              (success) {
                controller.tryingToLogin = false;
                if (success) {
                  Get.to(
                    () => const VerificationScreen(),
                    binding: BindingsBuilder.put(
                      () => VerificationController(),
                    ),
                    arguments: {
                      "email": controller.emailEController.text,
                      "from": "login",
                    },
                  );
                } else {
                  Get.dialog(
                    const AlertDialog(
                      content: Text(
                        "please make sure you filled the fields and your internet is connected",
                      ),
                    ),
                  );
                }
              },
            );
          },
          buttonText: "login".tr,
          textColor: Colors.white,
          backgroundColor: ShopLightColors.primaryColor,
        );
}
