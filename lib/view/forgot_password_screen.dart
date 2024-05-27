import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/assets/image_icon_assets.dart';
import '../resources/colors/app-colors.dart';
import '../resources/components/rounded_button.dart';
import '../resources/fonts/app_font_style.dart';
import '../resources/routes/routes_name.dart';
import '../resources/strings/app_stings.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

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
                          Get.offAllNamed(RoutesName.loginScreen);
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
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset(
                    ImageIconAssets.forgotPasswordImage,
                    width: 180,
                    height: 180,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.forgotPass,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                  Text(
                    AppStrings.forgotPasswordSubtitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(color: AppColors.blackColor),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              ImageIconAssets.emailIcon,
                              width: 30,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: AppStrings.emailHintText,
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
                      ),
                    ],
                  ),
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
                      onTap: () {},
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
