import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class LoadingAnimationSubmit extends StatelessWidget {
  LoadingAnimationSubmit({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 35,
              width: 35,
              child: LoadingAnimationWidget.hexagonDots(
                  color: themeController.isDarkMode.value
                      ? AppColors.darkLoadingAnimationColor
                      : AppColors.lightLoadingAnimationColor,
                  size: 35)),
        ],
      ),
    );
  }
}
