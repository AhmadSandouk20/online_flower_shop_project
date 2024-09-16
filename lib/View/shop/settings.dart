import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop/Common/preferences.dart';
import 'package:online_flower_shop/Conrtoller/languageController.dart';
import 'package:online_flower_shop/View/logScreens/login/loginScreen.dart';
import 'package:online_flower_shop/constants/shopText.dart';
import 'package:online_flower_shop/main.dart';

import '../../Conrtoller/shop/settingController.dart';
import '../../common/custom/customDialog.dart';
import '../../common/custom/customDropDownMenu.dart';
import '../../common/custom/customMaterialButton.dart';
import '../../common/custom/customText.dart';
import '../../Styles/colors.dart';
import '../../common/custom/customHeading.dart';
import '../../common/sizeConfig.dart';

class Settings extends GetView<SettingController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        fatherConstrains,
      ) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: fatherConstrains.maxWidth,
                height: fatherConstrains.maxHeight,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        SettingController.bottomWhiteRoseImage,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: fatherConstrains.maxWidth,
                        height: fatherConstrains.maxHeight * 78 / 100,
                        decoration: const BoxDecoration(
                          color: ShopLightColors.primaryBackgroundColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              60,
                            ),
                            bottomRight: Radius.circular(
                              60,
                            ),
                          ),
                        ),
                        child: LayoutBuilder(
                          builder: (context, fatherCons) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: SizeConfig.screenHeight * 0.1,
                                  child: CustomHeading(
                                    headingText: "settings".tr,
                                  ),
                                ),
                                Positioned(
                                  top: fatherCons.maxHeight * 20 / 100,
                                  right: sharedPrefs.shopLanguage == "en"
                                      ? 0
                                      : null,
                                  left: sharedPrefs.shopLanguage == "en"
                                      ? null
                                      : 0,
                                  child: Image.asset(
                                    SettingController.ellipseImage,
                                    height: fatherCons.maxHeight * 73 / 100,
                                  ),
                                ),
                                Positioned(
                                  top: fatherCons.maxHeight * 20 / 100,
                                  right: sharedPrefs.shopLanguage == "en"
                                      ? 0
                                      : null,
                                  left: sharedPrefs.shopLanguage == "en"
                                      ? null
                                      : 0,
                                  child: Image.asset(
                                    SettingController.ellipseFlowerImage,
                                  ),
                                ),
                                Positioned(
                                  height: fatherCons.maxHeight * 60 / 100,
                                  bottom: 20,
                                  left: 0,
                                  right:
                                      sharedPrefs.shopLanguage == "en" ? 2 : 12,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: fatherCons.maxWidth * 9 / 100,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "accountInformation".tr,
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "paymentMethods".tr,
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "orderHistory".tr,
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "securitySettings".tr,
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "suuport&feedback".tr,
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "languageSettings".tr,
                                            settingChildren:
                                                GetBuilder<LanguageController>(
                                              builder: (context) {
                                                return Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          languageController
                                                              .changeLanauage(
                                                        "ar",
                                                      ),
                                                      child: Text(
                                                        "arabic".tr,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          languageController
                                                              .changeLanauage(
                                                        "en",
                                                      ),
                                                      child: Text(
                                                        "english".tr,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: ShopText.themes,
                                            settingChildren:
                                                GetBuilder<LanguageController>(
                                              builder: (context) {
                                                return GetBuilder<
                                                    SettingController>(
                                                  builder: (nbb) {
                                                    return ListTile(
                                                      leading: const Icon(
                                                        Icons.bedtime_sharp,
                                                      ),
                                                      title: Text(
                                                        ShopText.darkMode,
                                                      ),
                                                      trailing: Switch(
                                                        value: controller
                                                            .isDarkSwitchSelect,
                                                        onChanged: (value) {
                                                          controller
                                                              .toggleDarkSwitchSelect();
                                                        },
                                                        activeColor: ShopLightColors
                                                            .primaryBackgroundColor,
                                                        activeTrackColor:
                                                            Colors.white,
                                                        inactiveThumbColor:
                                                            ShopDarkColors
                                                                .backgroundColor,
                                                        inactiveTrackColor:
                                                            Colors.white,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "legalInformation".tr,
                                          ),
                                          CustomDropdownMenu
                                              .buildCustomDropDownMenu(
                                            settingsController: controller,
                                            fatherCons: fatherCons,
                                            label: "aboutUs".tr,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: TextButton(
                                              onPressed: () async {
                                                double dialogWidth =
                                                    SizeConfig.screenWidth *
                                                        80 /
                                                        100;
                                                await Get.dialog(
                                                  AlertDialog(
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            dialogWidth *
                                                                5 /
                                                                100,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "logOutmessage".tr,
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: SizedBox(
                                                      width: dialogWidth,
                                                      height: SizeConfig
                                                              .screenHeight *
                                                          10 /
                                                          100,
                                                      child: LayoutBuilder(
                                                        builder: (
                                                          context,
                                                          cons,
                                                        ) {
                                                          return Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              MaterialButton(
                                                                minWidth:
                                                                    cons.maxWidth *
                                                                        40 /
                                                                        100,
                                                                height:
                                                                    cons.maxHeight *
                                                                        45 /
                                                                        100,
                                                                color: ShopLightColors
                                                                    .primaryBackgroundColor,
                                                                onPressed:
                                                                    () async {
                                                                  bool success =
                                                                      await controller
                                                                          .logout(
                                                                    sharedPrefs
                                                                        .token,
                                                                  );
                                                                  if (success) {
                                                                    sharedPrefs
                                                                        .token = '';
                                                                    Get.offAll(
                                                                      const LoginScreen(),
                                                                      arguments: {
                                                                        "logout":
                                                                            true,
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                child: Text(
                                                                  "yes".tr,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                      255,
                                                                      50,
                                                                      34,
                                                                      50,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              MaterialButton(
                                                                color: ShopLightColors
                                                                    .primaryBackgroundColor,
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                minWidth:
                                                                    cons.maxWidth *
                                                                        40 /
                                                                        100,
                                                                height:
                                                                    cons.maxHeight *
                                                                        45 /
                                                                        100,
                                                                child: Text(
                                                                  "no".tr,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: CustomText(
                                                text: "logOut".tr,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
