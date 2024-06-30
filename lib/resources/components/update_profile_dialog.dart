import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

import '../../utils/app_util.dart';
import '../colors/app-colors.dart';
import '../fonts/app_font_style.dart';
import '../strings/app_stings.dart';
import 'loading_animation_submit.dart';

class UpdateProfileDialog {
  final ThemeController themeController = Get.put(ThemeController());

  final _fireStore = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> showUpdateProfileDialog(BuildContext context) async {
    await Get.dialog(
      barrierDismissible: false,
      ListView(
        children: [
          AlertDialog(
            backgroundColor: themeController.isDarkMode.value
                ? AppColors.exitDarkColor
                : AppColors.exitLightColor,
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Update profile',
                textAlign: TextAlign.center,
              ),
            ),
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontFamily: AppFontStyle.amaranth,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
            content: StreamBuilder<DocumentSnapshot>(
                stream: _fireStore,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingAnimationSubmit();
                  }
                  if (snapshot.hasError) {
                    return AppUtil().showToastMessage('Error');
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Profile not found'));
                  }
                  var profileDetails = snapshot.data!.data() as Map<String, dynamic>;
                  final TextEditingController nameController = TextEditingController(text: profileDetails['name']);
                  final TextEditingController emailController = TextEditingController(text: profileDetails['email']);
                  final TextEditingController phoneController = TextEditingController(text: profileDetails['phone']);

                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: AppColors.blackColor,
                          style: const TextStyle(color: AppColors.blackColor),
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Name',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          cursorColor: AppColors.blackColor,
                          style: const TextStyle(color: AppColors.blackColor),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'email',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          cursorColor: AppColors.blackColor,
                          style: const TextStyle(color: AppColors.blackColor),
                          keyboardType: TextInputType.text,
                          controller: phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Phone number',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.noExitAppColor,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.whiteColor,
                                  size: 35,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: themeController.isDarkMode.value
                                  ? AppColors.exitLightColor
                                  : AppColors.exitDarkColor,
                              child: InkWell(
                                onTap: () {
                                  if(_formKey.currentState!.validate()){
                                    collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).update(
                                        {
                                          'name': nameController.text,
                                          'email': emailController.text,
                                          'phone': phoneController.text,
                                        }).then((onValue){
                                      AppUtil().showToastMessage('Profile update success');
                                      Get.back();
                                    }).onError((error, stackTrace){
                                      AppUtil().showToastMessage('Profile update unsuccessful');
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],

      ),
    );
  }
}
