import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:online_flower_shop/Bindings/shopMainPageBindings.dart';
import 'package:online_flower_shop/Common/language.dart';
import 'package:online_flower_shop/Common/preferences.dart';
import 'package:online_flower_shop/Conrtoller/languageController.dart';
import 'package:online_flower_shop/View/shop/homePage.dart';
import 'package:online_flower_shop/View/shop/shopMainPage.dart';
import './Bindings/logBindings.dart';
import './common/sizeConfig.dart';
import 'Styles/themes/themes.dart';
import './View/logScreens/login/loginScreen.dart';
import 'Middlewares/authMiddleware.dart';
import 'common/api/dioHelper.dart';

LanguageController languageController = Get.put(
  LanguageController(),
);
late bool authed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initHideStatusAndNvaigationMobileButtons();
  DioHelper.init();
  await sharedPrefs.init();

  authed = sharedPrefs.token != '' &&
          sharedPrefs.notExpiredCheck(
            sharedPrefs.tokenInitializeTime,
          )
      ? true
      : false;

  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(),
  //   ),
  // );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(
      context,
    );

    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        translations: Language(),
        locale: languageController.getLanguage(),

        theme: ShopThemes.lightTheme,
        darkTheme: ShopThemes.darkTheme,
        // themeMode:
        //     sharedPrefs.viewMode == "light" ? ThemeMode.light : ThemeMode.dark,

        // TODO UNCOMMENT
        initialBinding: authed ? ShopMainPageBindings() : LogBindings(),
        home: authed ? ShopMainPage() : const LoginScreen(),

        // initialBinding: ShopMainPageBindings(),
        // home: ShopMainPage(),
        // getPages: [
        //   GetPage(
        //     name: '/',
        //     page: () => const LoginScreen(),
        //     binding: LogBindings(),
        //     middlewares: [
        //       AuthMiddleWare(),
        //     ],
        //   ),
        //   GetPage(
        //     name: '/shopMainPage',
        //     page: () => ShopMainPage(),
        //     binding: ShopMainPageBindings(),
        //   ),
        // ],
      ),
    );
  }
}

initHideStatusAndNvaigationMobileButtons() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
}
