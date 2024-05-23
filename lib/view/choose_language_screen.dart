import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/fonts/english_font.dart';
import 'package:noteapp_firebase/responsive_widget.dart';

import '../view_models/controller/radio_controller.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  final RadioController controller = Get.put(RadioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ResponsiveWidget(
                mobile: Text(
                  'Choose',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                tab: Text(
                  'Choose',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                desktop: Text(
                  'Choose',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const ResponsiveWidget(
                mobile: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                tab: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                desktop: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ResponsiveWidget(
                mobile: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: RadioMenuButton(
                        trailingIcon: Image.asset(ImageIconAssets.englishFlag, width: 60,),
                        value: 'english_language'.tr,
                        groupValue: controller.selectedValue.value,
                        onChanged: (value) {
                          controller.setSelectedValue(value!);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20),),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColors.whiteColor),
                        ),
                        child: Text(
                          'english_language'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                tab: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: RadioMenuButton(
                        trailingIcon: Image.asset(ImageIconAssets.englishFlag, width: 80,),
                        value: 'english_language'.tr,
                        groupValue: controller.selectedValue.value,
                        onChanged: (value) {
                          controller.setSelectedValue(value!);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20),),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColors.whiteColor),
                        ),
                        child: Text(
                          'english_language'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                desktop: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: RadioMenuButton(
                        trailingIcon: Image.asset(ImageIconAssets.englishFlag, width: 100,),
                        value: 'english_language'.tr,
                        groupValue: controller.selectedValue.value,
                        onChanged: (value) {
                          controller.setSelectedValue(value!);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20),),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColors.whiteColor),
                        ),
                        child: Text(
                          'english_language'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              ResponsiveWidget(
                mobile: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: RadioMenuButton(
                        trailingIcon: Image.asset(ImageIconAssets.bangladeshFlag, width: 60,),
                        value: 'bangla_language'.tr,
                        groupValue: controller.selectedValue.value,
                        onChanged: (value) {
                          controller.setSelectedValue(value!);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20),),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColors.whiteColor),
                        ),
                        child: Text(
                          'bangla_language'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                tab: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: RadioMenuButton(
                        trailingIcon: Image.asset(ImageIconAssets.bangladeshFlag, width: 80,),
                        value: 'bangla_language'.tr,
                        groupValue: controller.selectedValue.value,
                        onChanged: (value) {
                          controller.setSelectedValue(value!);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20),),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColors.whiteColor),
                        ),
                        child: Text(
                          'bangla_language'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                desktop: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: RadioMenuButton(
                        trailingIcon: Image.asset(ImageIconAssets.bangladeshFlag, width: 100,),
                        value: 'bangla_language'.tr,
                        groupValue: controller.selectedValue.value,
                        onChanged: (value) {
                          controller.setSelectedValue(value!);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20),),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor: const MaterialStatePropertyAll(
                              AppColors.whiteColor),
                        ),
                        child: Text(
                          'bangla_language'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
