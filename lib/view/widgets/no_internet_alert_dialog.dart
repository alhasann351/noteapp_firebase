import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/resources/strings/app_stings.dart';

import '../../resources/colors/app-colors.dart';
import '../../view_models/controller/theme_controller.dart';

class NoInternetAlertDialog extends StatefulWidget {
  const NoInternetAlertDialog({super.key});

  @override
  State<NoInternetAlertDialog> createState() => _NoInternetAlertDialogState();
}

final ThemeController themeController = Get.put(ThemeController());

class _NoInternetAlertDialogState extends State<NoInternetAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlertDialog(
        icon: Image.asset(
          ImageIconAssets.onInternetImage,
          width: 80,
          height: 80,
          color: AppColors.whiteColor,
        ),
        title: const Text(
          AppStrings.noInternet,
          textAlign: TextAlign.center,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontFamily: AppFontStyle.amaranth,
          color: AppColors.whiteColor,
        ),
        content: const Text(
          AppStrings.checkInternet,
          textAlign: TextAlign.center,
        ),
        contentTextStyle: const TextStyle(
            fontSize: 18,
            fontFamily: AppFontStyle.amaranth,
            color: AppColors.whiteColor),
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.darkSnackbarBackgroundColor
            : AppColors.lightSnackbarBackgroundColor,
      ),
    );
  }
}
