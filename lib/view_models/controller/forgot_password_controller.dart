import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/utils/app_util.dart';

import '../../resources/routes/routes_name.dart';

class ForgotPasswordController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final emailController = TextEditingController().obs;
  RxBool loadingAnimation = false.obs;

  void forgotPassword() {
    loadingAnimation.value = true;

    _auth.sendPasswordResetEmail(
      email: emailController.value.text.toString(),
    ).then((value){
      loadingAnimation.value = false;
      AppUtil().showToastMessage('Email sent');
      Get.offAllNamed(RoutesName.loginScreen);
    }).onError((error, stackTrace){
      loadingAnimation.value = false;
      AppUtil().showToastMessage('Error');
    });
  }
}
