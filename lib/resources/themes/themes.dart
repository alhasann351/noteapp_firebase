import 'package:flutter/material.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';

class Themes{
  final ThemeData lightTheme = ThemeData(
    //primaryColor: AppColors.primaryLightColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
    color: AppColors.commonColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.primaryLightColor,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.whiteColor),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.blackColor,
      ),
    ),
    scaffoldBackgroundColor: AppColors.primaryLightColor,
  );

  final ThemeData darkTheme = ThemeData(
    //primaryColor: AppColors.primaryDarkColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
        color: AppColors.darkPopupButtonColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.primaryDarkColor,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.whiteColor),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.blackColor,
      ),
    ),
    scaffoldBackgroundColor: AppColors.primaryDarkColor,
  );
}