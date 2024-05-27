import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';
import '../resources/assets/image_icon_assets.dart';
import '../resources/colors/app-colors.dart';
import '../resources/components/rounded_button.dart';
import '../resources/fonts/app_font_style.dart';
import '../resources/routes/routes_name.dart';
import '../resources/strings/app_stings.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final ThemeController themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offNamed(RoutesName.loginScreen);
                        },
                        child: Image.asset(
                          ImageIconAssets.backIcon,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: CircleAvatar(
                    child: Image.asset(
                      ImageIconAssets.loginPhoneImage,
                      width: 180,
                      height: 180,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.loginPhoneTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                  Text(
                    AppStrings.loginPhoneSubtitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntlPhoneField(
                      onChanged: (value) {},
                      initialCountryCode: 'BD',
                      pickerDialogStyle: PickerDialogStyle(
                        searchFieldInputDecoration: const InputDecoration(
                          icon: Icon(Icons.search_outlined),
                          iconColor: AppColors.blackColor,
                          labelText: 'Search',
                          labelStyle: TextStyle(color: AppColors.blackColor)
                        ),
                        searchFieldCursorColor: AppColors.blackColor,
                        countryCodeStyle: const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth,),
                        countryNameStyle: const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth,),
                        backgroundColor: AppColors.primaryLightColor,
                      ),
                      dropdownIcon: const Icon(Icons.arrow_drop_down_outlined, color: AppColors.blackColor,),
                      dropdownTextStyle: const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontWeight: FontWeight.bold,),
                      keyboardType: TextInputType.phone,
                      cursorColor: AppColors.blackColor,
                      style: const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth,),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            style: BorderStyle.none,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RoundedButton(
                      title: AppStrings.submit,
                      backgroundColor: AppColors.buttonColor,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontStyle.amaranth,
                        color: AppColors.whiteColor,
                      ),
                      onTap: () {
                        Get.offNamed(RoutesName.otpVerifyScreen);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Get.offNamed(RoutesName.loginScreen);
                    },
                    icon: Image.asset(
                      ImageIconAssets.emailIcon,
                      width: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 2, color: AppColors.commonColor)),
                    label: const Text(
                      AppStrings.loginEmailAddress,
                      style: TextStyle(
                          fontSize: 18, fontFamily: AppFontStyle.amaranth),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.notHaveAccount,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(RoutesName.signupScreen);
                        },
                        child: const Text(
                          AppStrings.signup,
                          style: TextStyle(
                              fontSize: 17, fontFamily: AppFontStyle.amaranth),
                        ),
                      )
                    ],
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
