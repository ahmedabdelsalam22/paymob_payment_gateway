import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: Colors.deepOrange,
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      color: ColorManager.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: ColorManager.deepOrange,
          fontWeight: FontWeight.w700,
          fontSize: 20),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorManager.deepOrange,
        unselectedItemColor: ColorManager.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 100.0),
    fontFamily: 'pro');
