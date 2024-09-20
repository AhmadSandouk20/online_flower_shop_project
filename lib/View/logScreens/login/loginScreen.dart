import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/shopText.dart';
import '../../../common/sizeConfig.dart';
import '../../../Conrtoller/LogControllers/loginController.dart';
import 'loginWidgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Stack(
              children: [
                Positioned(
                  left: SizeConfig.screenWidth / 7,
                  top: SizeConfig.screenHeight / 8,
                  child: Text(
                    ShopText.logo,
                    style: TextStyle(
                      // color: ShopLightColors.primaryColor,
                      fontSize: 64.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  top: 0.h,
                  right: 0,
                  width: SizeConfig.screenWidth / 2,
                  child: Image.asset(
                    loginController.ellipse2,
                    // color: Theme.of(context).,
                  ),
                ),
                Positioned(
                  right: SizeConfig.screenWidth / 21,
                  top: 0,
                  height: 230,
                  child: Image.asset(
                    width: SizeConfig.screenWidth / 2,
                    loginController.bunchOrchidwithLilaWallDecal,
                  ),
                ),
                middle(
                  context: context,
                  controller: loginController,
                  signUp: false,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    loginController.ellipse1,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    loginController.blueBottomLoginFlower,
                  ),
                ),

                // TODO
                //  if(loginController.checkIfLoggeOut())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
