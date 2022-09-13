import 'package:flutter/material.dart';
import 'package:news/cubit/home_cubit.dart';

import '../helpers/cash_helper.dart';

Color primaryClr = Colors.deepOrange;

class Themes {
  static ThemeData get customDark {
    return ThemeData.dark().copyWith(
        primaryColor: primaryClr,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryClr,
          selectedItemColor: primaryClr,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
        ),
        appBarTheme:
            const AppBarTheme(color: Colors.transparent, elevation: 0));
  }

  static ThemeData get customLight {
    return ThemeData.light().copyWith(
        primaryColor: primaryClr,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryClr,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        ),
        appBarTheme:
            const AppBarTheme(color: Colors.transparent, elevation: 0));
  }

}
TextStyle  primaryStyle (context){
  return  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
      color:  CashHelper.getData('isDark')? Colors.white :Colors.black
  );
}
