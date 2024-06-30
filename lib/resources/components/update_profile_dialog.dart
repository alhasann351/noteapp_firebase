import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

import '../colors/app-colors.dart';
import '../fonts/app_font_style.dart';
import '../strings/app_stings.dart';

class UpdateProfileDialog {
  final ThemeController themeController = Get.put(ThemeController());

  Future<void> showUpdateProfileDialog(BuildContext context) async {
    await Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.exitDarkColor
            : AppColors.exitLightColor,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Update profile',
            textAlign: TextAlign.center,
          ),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontFamily: AppFontStyle.amaranth,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        content: SizedBox(
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                cursorColor: AppColors.blackColor,
                style: const TextStyle(color: AppColors.blackColor),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                cursorColor: AppColors.blackColor,
                style: const TextStyle(color: AppColors.blackColor),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                cursorColor: AppColors.blackColor,
                style: const TextStyle(color: AppColors.blackColor),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Phone number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.noExitAppColor,
                    child: InkWell(
                      onTap: () {
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
                      onTap: () {},
                      child: const Icon(
                        Icons.check,
                        color: AppColors.whiteColor,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
