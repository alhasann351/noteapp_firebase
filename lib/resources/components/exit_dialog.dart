import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

import '../fonts/app_font_style.dart';
import '../strings/app_stings.dart';

class ExitDialog {
  final ThemeController themeController = Get.put(ThemeController());

  Future<bool> showExitDialog(BuildContext context) async {
    bool exit = false;
    await Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.exitDarkColor
            : AppColors.exitLightColor,
        icon: Image.asset(
          ImageIconAssets.exitDialogImage,
          height: 70,
          width: 70,
          color: AppColors.whiteColor,
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            AppStrings.exitText,
            textAlign: TextAlign.center,
          ),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontFamily: AppFontStyle.amaranth,
          color: AppColors.whiteColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.noExitAppColor,
                  child: InkWell(
                    onTap: (){
                      exit = false;
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                      size: 35,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: themeController.isDarkMode.value
                      ? AppColors.exitLightColor
                      : AppColors.exitDarkColor,
                  child: InkWell(
                    onTap: (){
                      exit = true;
                      SystemNavigator.pop();
                    },
                    child: const Icon(
                      Icons.check,
                      color: AppColors.whiteColor,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return exit;
  }
}
