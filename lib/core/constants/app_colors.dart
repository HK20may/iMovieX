import 'package:flutter/material.dart';

class AppColors {
  // public colors
  static const Color greyColor = Color(0xFFA3B2CF);
  static const Color secondaryBlackColor = Color.fromRGBO(31, 36, 45, 0.12);
  static const Color boxShadowColor = Color(0xFF1F242D);
  static const Color backgroundColor = Color.fromARGB(255, 142, 111, 145);

  // // private colors for material color shades
  static const int _bluePrimaryValue = 0xFF8694AC;
  static const int _greenPrimaryValue = 0xFF81A713;
  static const int _redPrimaryValue = 0xFFD43E2A;
  static const int _yellowPrimaryValue = 0xFFFFA700;

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFF3FBDA),
      100: Color(0xFFF3FBDA),
      200: Color(0xFFE9F8BF),
      300: Color(0xFFD3F07F),
      400: Color(0xFFC0EA48),
      500: Color(0xFFAADC19),
      600: Color(_greenPrimaryValue),
      650: Color(0xFF556E0D),
      700: Color(0xFF5A6C23),
      800: Color(0xFF394908),
      900: Color(0xFF232E05),
    },
  );

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      100: Color(0xFFFCE9E8),
      200: Color(0xFFFAD4D1),
      300: Color(0xFFF4ABA4),
      400: Color(0xFFEF8576),
      500: Color(0xFFE95649),
      600: Color(_redPrimaryValue),
      700: Color(0xFF912411),
      800: Color(0xFF72200E),
      900: Color(0xFF441508),
    },
  );

  static const MaterialColor yellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
      100: Color(0xFFFFF6E5),
      200: Color(0xFFFFEDCC),
      300: Color(0xFFFFDC99),
      400: Color(0xFFFFCA66),
      500: Color(0xFFFFB933),
      600: Color(_yellowPrimaryValue),
      700: Color(0xFFB27500),
      800: Color(0xFF805400),
      900: Color(0xFF332100),
    },
  );

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFF0F2F5),
      300: Color(0xFFE1E4EA),
      400: Color(0xFFC3C9D5),
      500: Color(0xFFA4AFC1),
      600: Color(_bluePrimaryValue),
      700: Color(0xFF536179),
      800: Color(0xFF343D4C),
      900: Color(0xFF1F242D),
    },
  );
}
