import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Obx(() {
            return Switch(
                value: themeController.isDarkMode.value,
                onChanged: (value) {
                  themeController.switchTheme();
                });
          }),
        ],
      ),
    );
  }
}
