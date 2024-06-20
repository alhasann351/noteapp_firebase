import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/utils/app_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/routes/routes_name.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loadingAnimation = false.obs;

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    super.dispose();
  }

  void login() {
    loadingAnimation.value = true;

    _auth.signInWithEmailAndPassword(
      email: emailController.value.text.toString(),
      password: passwordController.value.text.toString(),
    ).then((value) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String email = emailController.value.text.toString();
      String password = passwordController.value.text.toString();
      sharedPreferences.setString('email', email);
      sharedPreferences.setString('password', password);
      loadingAnimation.value = false;
      AppUtil().showToastMessage('Login successful');
      Get.offAllNamed(RoutesName.notesScreen);
    }).onError((error, stackTrace){
      loadingAnimation.value = false;
      AppUtil().showToastMessage('Error');
    });
  }
}
