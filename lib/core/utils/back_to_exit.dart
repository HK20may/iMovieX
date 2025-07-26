import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inshorts_movies/core/constants/string_constants.dart';

class BackToExit {
  static DateTime? currentBackPressTime;
  static bool onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: StringConstants.pressBackAgainToExit);
      return false;
    }
    SystemNavigator.pop();
    return true;
  }
}
