import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/components/loading_animation_submit.dart';
import 'package:noteapp_firebase/utils/app_util.dart';

import '../resources/assets/image_icon_assets.dart';
import '../resources/colors/app-colors.dart';
import '../resources/components/rounded_button.dart';
import '../resources/fonts/app_font_style.dart';
import '../resources/routes/routes_name.dart';
import '../resources/strings/app_stings.dart';
import '../view_models/controller/auth_controller.dart';

class OtpVerifyScreen extends StatefulWidget {
  String? verificationId;

  OtpVerifyScreen({super.key, this.verificationId});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
  final AuthController authController = Get.find();
  final TextEditingController otpController = TextEditingController();
  /*String? _code1 = '';
  String? _code2 = '';
  String? _code3 = '';
  String? _code4 = '';
  String? _code5 = '';
  String? _code6 = '';
  String? _code = '';
  final _auth = FirebaseAuth.instance;
  bool loadingAnimation = false;
  TextEditingController otpController = TextEditingController();*/

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
                          Get.back(); //RoutesName.loginPhoneNumberScreen);
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
                      child: TextFormField(
                        controller: otpControllers[index],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 24),
                        onChanged: (value) {
                          if (value.length == 1 && index < 5) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 42,
                      child: TextFormField(
                        controller: otpController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            //_code1 = value.toString();
                          }
                        },
                        textAlign: TextAlign.center,
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFontStyle.amaranth,
                          fontSize: 20,
                        ),
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
                        controller: otpController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            _code2 = value.toString();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFontStyle.amaranth,
                          fontSize: 20,
                        ),
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
                        controller: otpController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            _code3 = value.toString();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFontStyle.amaranth,
                          fontSize: 20,
                        ),
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
                        controller: otpController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            _code4 = value.toString();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFontStyle.amaranth,
                          fontSize: 20,
                        ),
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
                        controller: otpController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            _code5 = value.toString();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFontStyle.amaranth,
                          fontSize: 20,
                        ),
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
                        controller: otpController,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            _code6 = value.toString();
                          }
                        },
                        cursorColor: AppColors.blackColor,
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: AppFontStyle.amaranth,
                          fontSize: 20,
                        ),
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
                ),*/
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Obx(() => authController.isLoading.value ? LoadingAnimationSubmit() : RoundedButton(
                      title: AppStrings.verify,
                      backgroundColor: AppColors.buttonColor,
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontStyle.amaranth,
                        color: AppColors.whiteColor,
                      ),
                      onTap: () {
                        /*setState(() {
                          loadingAnimation = true;
                        });

                        final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId!,
                          smsCode: otpController.text.toString(),
                        );

                        try{
                          await _auth.signInWithCredential(credential);

                          Get.offNamed(RoutesName.notesScreen);

                          setState(() {
                            loadingAnimation = false;
                          });

                        }catch(e){
                          setState(() {
                            loadingAnimation = false;
                          });

                          AppUtil().showToastMessage(e.toString());
                        }
*/
                        String otp = otpControllers.map((controller) => controller.text).join();
                        authController.verifyOTP(otp);
                      },
                    ),),
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
