import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  static const _key = 'isDarkMode';
  RxBool isDarkMode = false.obs;

  @override
  void onInit(){
    _loadTheme();
    super.onInit();
  }

  Future<void> switchTheme() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isDarkMode.value = !isDarkMode.value;
    preferences.setBool(_key, isDarkMode.value);
  }

  Future<void> _loadTheme() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isDarkMode.value = preferences.getBool(_key) ?? false;
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}