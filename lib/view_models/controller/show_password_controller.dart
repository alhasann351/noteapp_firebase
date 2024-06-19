import 'package:get/get.dart';

class ShowPasswordController extends GetxController{
  RxBool showPassword = true.obs;

  passwordShow(){
    showPassword.value = !showPassword.value;
  }
}