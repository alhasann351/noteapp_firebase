import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../resources/assets/image_icon_assets.dart';
import '../resources/colors/app-colors.dart';
import '../resources/components/rounded_button.dart';
import '../resources/fonts/app_font_style.dart';
import '../resources/routes/routes_name.dart';
import '../resources/strings/app_stings.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('otp f');
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
                          Get.back();//RoutesName.loginPhoneNumberScreen);
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
                    backgroundColor: AppColors.whiteColor,
                    child: Image.asset(
                      ImageIconAssets.otpImage,
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
                    AppStrings.otpTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFontStyle.amaranth,
                    ),
                  ),
                  Text(
                    AppStrings.otpSubtitle,
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
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        cursorColor: AppColors.blackColor,
                        style:
                            const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontSize: 20,),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: Colors.white,
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
                    ),
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style:
                        const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontSize: 20,),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: Colors.white,
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
                    ),
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style:
                        const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontSize: 20,),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: Colors.white,
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
                    ),
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style:
                        const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontSize: 20,),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: Colors.white,
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
                    ),
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style:
                        const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontSize: 20,),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: Colors.white,
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
                    ),
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style:
                        const TextStyle(color: AppColors.blackColor, fontFamily: AppFontStyle.amaranth, fontSize: 20,),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          fillColor: Colors.white,
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
                      title: AppStrings.verify,
                      backgroundColor: AppColors.buttonColor,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontStyle.amaranth,
                        color: AppColors.whiteColor,
                      ),
                      onTap: () {
                        Get.offNamed(RoutesName.notesScreen);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.noReceivedOtp,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: AppFontStyle.amaranth,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          AppStrings.resendOtp,
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
