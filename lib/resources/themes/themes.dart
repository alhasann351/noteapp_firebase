import 'package:flutter/material.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';

class Themes{
  final ThemeData lightTheme = ThemeData(
    //primaryColor: AppColors.primaryLightColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryLightColor,
  );

  final ThemeData darkTheme = ThemeData(
    //primaryColor: AppColors.primaryDarkColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
  );
}