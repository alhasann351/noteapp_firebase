import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';

class ExitDialog {
  Future<bool> showExitDialog() async {
    bool exit = false;
    await Get.defaultDialog(
      title: "Exit App",
      middleText: "Do you really want to exit the app?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () {
        exit = true;
        Get.back();
      },
      onCancel: () {
        exit = false;
      },
    );
    return exit;
  }
}
  /*Future<bool> showExitDialog(BuildContext context) async {
    bool exit = false;
    await Get.dialog(
      AlertDialog(
        icon: Image.asset(
          ImageIconAssets.exitDialogImage,
          height: 80,
          width: 80,
          color: AppColors.whiteColor,
        ),
      ),
    );
    return exit;
  }*/

