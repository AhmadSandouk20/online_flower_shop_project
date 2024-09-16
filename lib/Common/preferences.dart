import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

final SharedPrefs sharedPrefs = SharedPrefs();

class SharedPrefs {
  late final SharedPreferences _shopPrefs;

  Future<void> init() async {
    _shopPrefs = await SharedPreferences.getInstance();
  }

  String get shopLanguage => _shopPrefs.getString("lang") ?? "en";

  set shopLanguage(String value) {
    _shopPrefs.setString("lang", value);
  }

  String get viewMode => _shopPrefs.getString("mode") ?? "light";

  set viewMode(String value) {
    _shopPrefs.setString("mode", value);
    log("view Mode accessed and its value is ${_shopPrefs.getString("mode")}");
  }

  String get token => _shopPrefs.getString("token") ?? "";

  set token(String value) {
    _shopPrefs.setString("token", value);
    log(sharedPrefs.token);
  }

  String get tokenInitializeTime =>
      _shopPrefs.getString("tokenInitializeTime") ?? "";

  set tokenInitializeTime(String value) {
    _shopPrefs.setString("tokenInitializeTime", value);
  }

  bool notExpiredCheck(String tokenInitializeTime) {
    Duration tokenInitDuration = DateTime.now().difference(
      DateTime.parse(
        tokenInitializeTime,
      ),
    );
    return tokenInitDuration <
        const Duration(
          minutes: 3,
        );
  }
}



// TODO userImage, token,  
