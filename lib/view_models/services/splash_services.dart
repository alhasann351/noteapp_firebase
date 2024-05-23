import 'dart:async';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/routes/routes_name.dart';

class SplashServices{
  void isLogin(){
    Timer(const Duration(seconds: 3), () => Get.offNamed(RoutesName.chooseLanguageScreen));
  }
}