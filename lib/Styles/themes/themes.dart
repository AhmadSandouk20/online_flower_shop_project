import 'package:flutter/material.dart';

import './customThemes.dart';
import '../colors.dart';
import '../fonts.dart';

// class ShopThemes {
//   ShopThemes._();
//   static ThemeData lightTheme = ThemeData.light().copyWith(
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
//     scaffoldBackgroundColor: ShopLightColors.primaryBackgroundColor,

//     textTheme: const TextTheme().copyWith(
//       displayLarge: TextStyle(
//         color: Colors.black,
//       ),
//       displaySmall: TextStyle(
//         color: Colors.black,
//       ),
//     ),
//   );
//   static ThemeData darkTheme = ThemeData.dark().copyWith(
//     scaffoldBackgroundColor: ShopDarkColors.backgroundColor,
//     bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
//       backgroundColor: ShopLightColors.primaryBackgroundColor,
//       selectedItemColor: ShopLightColors.primaryColor,
//       unselectedItemColor: Colors.black,
//     ),
//     textTheme: const TextTheme().copyWith(
//       //text out
//       bodyMedium: const TextStyle(
//         color: Color(0xffD8e8e8),
//       ),
//       //text field text
//       bodyLarge: const TextStyle(
//         color: ShopDarkColors.lighterPinkColor,
//       ),
//     ),
//   );

//   static ThemeData pdfTheme(labelColor) => ThemeData(
//         inputDecorationTheme: InputDecorationTheme(
//           fillColor: ShopLightColors.primaryColor,
//           labelStyle: TextStyle(
//             color: labelColor,
//             fontFamily: ShopFonts.roboto,
//           ),
//           filled: true,
//         ),
//         primaryColor: ShopLightColors.primaryTextColor,
//       );
// }

// ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
//   return ThemeData(
//     scaffoldBackgroundColor:
//         isDarkTheme ? ShopDarkColors.backgroundColor : Colors.white,
//     textTheme: Theme.of(context)
//         .textTheme(

//         )
//         .copyWith(
//           titleSmall:
//               Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
//         )
//         .apply(
//           bodyColor: isDarkTheme ? Colors.white : Colors.black,
//           displayColor: Colors.grey,
//         ),
//     switchTheme: SwitchThemeData(
//       thumbColor: WidgetStateProperty.all(
//         isDarkTheme ? Colors.orange : Colors.purple,
//       ),
//     ),
//   );
// }

class ShopThemes {
  ShopThemes._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ShopLightColors.primaryBackgroundColor,
    textTheme: Customthemes.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ShopDarkColors.backgroundColor,
    textTheme: Customthemes.darkTextTheme,
  );

  static ThemeData pdfTheme(labelColor) => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: ShopLightColors.primaryColor,
          labelStyle: TextStyle(
            color: labelColor,
            fontFamily: ShopFonts.roboto,
          ),
          filled: true,
        ),
        primaryColor: ShopLightColors.primaryTextColor,
      );
}
