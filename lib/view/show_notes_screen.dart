import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noteapp_firebase/resources/components/rounded_button.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

import '../resources/colors/app-colors.dart';
import '../resources/fonts/app_font_style.dart';

class ShowNotesScreen extends StatefulWidget {
  const ShowNotesScreen({super.key});

  @override
  State<ShowNotesScreen> createState() => _ShowNotesScreenState();
}

class _ShowNotesScreenState extends State<ShowNotesScreen> {
  final ThemeController themeController = Get.put(ThemeController());
  final TextEditingController notesTitleEditingController =
      TextEditingController();
  final TextEditingController notesContentEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: const Text(
          'Notes Show',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: AppFontStyle.amaranth,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  cursorColor: themeController.isDarkMode.value
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                  keyboardType: TextInputType.text,
                  controller: notesTitleEditingController
                    ..text = Get.arguments['note-title'],
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: AppFontStyle.amaranth),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: themeController.isDarkMode.value
                        ? AppColors.primaryDarkColor
                        : AppColors.primaryLightColor,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  cursorColor: themeController.isDarkMode.value
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                  keyboardType: TextInputType.text,
                  controller: notesContentEditingController
                    ..text = Get.arguments['note-content'],
                  style: const TextStyle(
                      height: 1.5,
                      fontSize: 20,
                      fontFamily: AppFontStyle.amaranth),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: themeController.isDarkMode.value
                        ? AppColors.primaryDarkColor
                        : AppColors.primaryLightColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RoundedButton(
                    backgroundColor: AppColors.buttonColor,
                    title: 'Save to change',
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFontStyle.amaranth,
                      color: AppColors.whiteColor,
                    ),
                    onTap: () {

                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
