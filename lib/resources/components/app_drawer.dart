import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/data/logout.dart';
import 'package:noteapp_firebase/utils/app_util.dart';
import 'package:noteapp_firebase/view/widgets/favorite_notes_stream_builder.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

import '../routes/routes_name.dart';
import '../themes/themes.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final ThemeController themeController = Get.put(ThemeController());
  final Logout logout = Logout();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Obx(() => ListView(
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
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
                        color: themeController.isDarkMode.value
                            ? AppColors.darkPopupButtonColor
                            : AppColors.lightPopupButtonColor,
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
                            onTap: () {
                              logout.logOut();
                              themeController.isDarkMode.value = false;
                            },
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
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontStyle.amaranth,
                      ),
                    ),
                    Obx(() {
                      return Switch(
                          value: themeController.isDarkMode.value,
                          onChanged: (value) {
                            themeController.switchTheme();
                          });
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(RoutesName.favoriteNotesScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favorite notes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      Image.asset(ImageIconAssets.favoriteIcon, width: 40, height: 40, color: themeController.isDarkMode.value ? AppColors.drawerItemsIconColor : AppColors.commonColor,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    AppUtil().showToastMessage('Share app click');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Share App',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      Image.asset(ImageIconAssets.shareIcon, width: 40, height: 40, color: themeController.isDarkMode.value ? AppColors.drawerItemsIconColor : AppColors.commonColor,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    AppUtil().showToastMessage('More apps click');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'More Apps',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      Image.asset(ImageIconAssets.moreAppsIcon, width: 40, height: 40, color: themeController.isDarkMode.value ? AppColors.drawerItemsIconColor : AppColors.commonColor,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    AppUtil().showToastMessage('Rate app click');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rate App',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      Image.asset(ImageIconAssets.rateAppIcon, width: 40, height: 40, color: themeController.isDarkMode.value ? AppColors.drawerItemsIconColor : AppColors.commonColor,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    AppUtil().showToastMessage('Privacy click');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Privacy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      Image.asset(ImageIconAssets.privacyIcon, width: 40, height: 40, color: themeController.isDarkMode.value ? AppColors.drawerItemsIconColor : AppColors.commonColor,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: (){
                    AppUtil().showToastMessage('Terms & Conditions click');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      Image.asset(ImageIconAssets.termsIcon, width: 40, height: 40, color: themeController.isDarkMode.value ? AppColors.drawerItemsIconColor : AppColors.commonColor,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),),
    ));
  }
}
