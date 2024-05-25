import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/components/rounded_button.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/resources/strings/app_stings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.loginTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                  const Text(
                    AppStrings.loginSubtitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      ImageIconAssets.loginImage,
                      width: 250,
                      height: 250,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
                            child: Image.asset(ImageIconAssets.emailIcon, width: 30,),
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
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(color: AppColors.blackColor),
                        keyboardType: TextInputType.text,
                        obscureText: showPassword,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(ImageIconAssets.passwordIcon, width: 30,),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: Icon(
                              showPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.blackColor,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: AppStrings.passwordHintText,
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
                      title: AppStrings.login,
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        AppStrings.forgotPass,
                        style: TextStyle(
                            fontSize: 17, fontFamily: AppFontStyle.amaranth),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(ImageIconAssets.phoneIcon, width: 30,),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 2, color: AppColors.commonColor)),
                    label: const Text(
                      AppStrings.loginPhoneNumber,
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
                        AppStrings.haveAccount,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          AppStrings.signup,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: AppFontStyle.amaranth),
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
