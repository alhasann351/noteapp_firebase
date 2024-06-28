import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
        Text(
        Get.arguments['note-title'].toString(),
          textAlign: TextAlign.justify,
        style: const TextStyle(
          //color: AppColors.whiteColor,
          fontFamily: AppFontStyle.amaranth,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 15,),
      Text(
        Get.arguments['note-content'].toString(),
        textAlign: TextAlign.start,
        style: const TextStyle(
          height: 1.5,
          //color: AppColors.whiteColor,
          fontFamily: AppFontStyle.amaranth,
          fontSize: 21,
        ),
      )],
        ),
      ),
    );
  }
}
