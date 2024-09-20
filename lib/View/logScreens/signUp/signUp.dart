import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_flower_shop/constants/shopText.dart';
import 'dart:developer';

import '../../../common/sizeConfig.dart';
import '../../../Conrtoller/LogControllers/VerificationController.dart';
import '../../../common/custom/customMaterialButton.dart';
import '../../../common/custom/dialogTextbutton.dart';
import '../../../View/logScreens/verification/verificationScreen.dart';
import '../../../View/logScreens/logForm.dart';
import '../../../View/logScreens/clipers/signUpClipper.dart';
import '../../../Conrtoller/LogControllers/SignUpController.dart';
import '../../../Styles/fonts.dart';
import '../../../common/custom/customHeading.dart';
import '../../../Styles/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.find<SignUpController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: SignUpClipper(),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight / 3,
                    color: ShopLightColors.lightPinkColor,
                  ),
                ),
                Positioned(
                  top: SizeConfig.screenHeight / 7.5,
                  width: SizeConfig.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomHeading(
                        headingText: ShopText.signUp,
                        isBold: false,
                        fontFamily: ShopFonts.roboto,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    signUpController.signupFlower,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
                Positioned(
                  top: 165,
                  left: 140,
                  child: Stack(
                    children: [
                      GetBuilder<SignUpController>(
                        builder: (context) {
                          return CircleAvatar(
                            backgroundColor: ShopLightColors.lightGreyColor,
                            foregroundColor: ShopLightColors.lightGreyColor,
                            foregroundImage:
                                signUpController.profileImage != null
                                    ? FileImage(signUpController.profileImage!)
                                    : const AssetImage(
                                        "assets/images/SignUp/profile.png",
                                      ),
                            radius: 40.h,
                          );
                        },
                      ),
                      Positioned(
                        bottom: -10.h,
                        right: -10.h,
                        child: IconButton(
                          onPressed: () async {
                            await Get.defaultDialog(
                              title: ShopText.chooseImage,
                              titleStyle: TextStyle(
                                fontSize: 15.sp,
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomDialogTextButtonWithIcon
                                      .dialogTextButtonWithIcon(
                                    icon: const Icon(
                                      Icons.camera,
                                    ),
                                    labelText: ShopText.camera,
                                    onPressed: () async {
                                      await signUpController.pickImage(
                                        ImageSource.camera,
                                        signUpController,
                                      );
                                    },
                                  ),
                                  CustomDialogTextButtonWithIcon
                                      .dialogTextButtonWithIcon(
                                    icon: const Icon(
                                      Icons.add_photo_alternate_outlined,
                                    ),
                                    labelText: ShopText.gallery,
                                    onPressed: () async {
                                      await signUpController.pickImage(
                                        ImageSource.gallery,
                                        signUpController,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GetBuilder<SignUpController>(
              builder: (vio) => Center(
                child: Text(
                  signUpController.profileImage == null
                      ? ShopText.addProfilePhoto
                      : "",
                ),
              ),
            ),
            logForm(
              context: context,
              logController: signUpController,
              signUp: true,
            ),
            SizedBox(
              height: 25.h,
            ),
            GetX<SignUpController>(
              builder: (b) => buttonOrIndicator(
                signUpController,
                signUpController.tryingToSign,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () => Get.back(),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: ShopLightColors.primaryTextColor,
                    decoration: TextDecoration.underline,
                  ),
                  text: ShopText.hasAccount,
                  children: <TextSpan>[
                    TextSpan(
                      text: ShopText.login,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: ShopLightColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buttonOrIndicator(
  SignUpController signUpController,
  bool trying,
) {
  return trying
      ? const CircularProgressIndicator()
      : CustomMaterialbutton(
          onPressed: () async {
            log("hey from signup");
            bool dataIsValid = signUpController.validateInputs();
            if (dataIsValid) {
              signUpController.tryingToSign = true;
              await signUpController.getUserInputs().then(
                (
                  user,
                ) async {
                  await signUpController
                      .signUp(
                    user.toMultiTypes(),
                  )
                      .then(
                    (success) {
                      if (success) {
                        signUpController.tryingToSign = false;

                        Get.to(
                          () => const VerificationScreen(),
                          binding: BindingsBuilder.put(
                            () => VerificationController(),
                          ),
                          arguments: {
                            "email": signUpController.emailEController.text,
                            "from": "signup",
                          },
                        );
                      }
                    },
                  );
                },
              );
            }
          },
          buttonText: ShopText.theSignup,
          backgroundColor: ShopLightColors.primaryColor,
          textColor: Colors.white,
        );
}
