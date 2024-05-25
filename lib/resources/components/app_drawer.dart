import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.drawerHeaderColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontStyle.amaranth,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    PopupMenuButton(
                      color: AppColors.popupButtonColor,
                      icon: Image.asset(
                        ImageIconAssets.popupMenuIcon,
                        width: 30,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          onTap: () {},
                          child: ListTile(
                            title: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFontStyle.amaranth,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            trailing: Image.asset(
                              ImageIconAssets.editIcon,
                              width: 26,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          onTap: () {},
                          child: ListTile(
                            title: const Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFontStyle.amaranth,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            trailing: Image.asset(
                              ImageIconAssets.logoutIcon,
                              width: 26,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
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
        ],
      )),
    );
  }
}
