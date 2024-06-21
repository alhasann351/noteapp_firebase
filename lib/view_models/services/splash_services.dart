import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_util.dart';

class SplashServices{
  final _auth = FirebaseAuth.instance;

  Future<void> isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? email = sharedPreferences.getString('email');
    String? password = sharedPreferences.getString('password');
    String? login = sharedPreferences.getString('login');

  if(email != null && password != null || login != null){
      try{
        //await _auth.signInWithEmailAndPassword(email: email, password: password);
        Timer(const Duration(seconds: 3), () => Get.offAllNamed(RoutesName.notesScreen));
      }catch(e){
        if (kDebugMode) {
          print(e.toString());
        }
        AppUtil().showToastMessage('Error');
      }
    }else{
      Timer(const Duration(seconds: 3), () => Get.offNamed(RoutesName.loginScreen));
    }

    /*if(login != null){
      Timer(const Duration(seconds: 3), () => Get.offAllNamed(RoutesName.notesScreen));
    }else{
      Timer(const Duration(seconds: 3), () => Get.offNamed(RoutesName.loginScreen));
    }*/

    //Timer(const Duration(seconds: 3), () => Get.offNamed(RoutesName.loginScreen));
  }
}