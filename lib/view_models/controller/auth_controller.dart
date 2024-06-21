/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:noteapp_firebase/utils/app_util.dart';

import '../../resources/routes/routes_name.dart';

class LoginPhoneController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final phoneController = TextEditingController().obs;
  RxString? phoneNumber = ''.obs;
  RxString? code = ''.obs;

  RxBool loadingAnimation = false.obs;

  void loginPhoneNumber() {
    loadingAnimation.value = true;
    _auth.verifyPhoneNumber(
      phoneNumber: code!.value+phoneController.value.text.toString(),
      verificationCompleted: (_) {
        loadingAnimation.value = false;
      },
      verificationFailed: (e){
        loadingAnimation.value = false;
        AppUtil().showToastMessage('Verification failed error');
      },
      codeSent: (String verificationId, int? token){
        loadingAnimation.value = false;
        Get.toNamed(RoutesName.otpVerifyScreen, parameters: {verificationId: verificationId});
      },
      codeAutoRetrievalTimeout: (e){
        loadingAnimation.value = false;
        AppUtil().showToastMessage('Code timeout error');
      },
    );
  }
}*/

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/routes/routes_name.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  var isLoading = false.obs;

  void signInWithPhoneNumber(String phoneNumber) async {
    isLoading.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        String login = verificationId.value.toString();
        sharedPreferences.setString('login', login);
        isLoading.value = false;
        Get.snackbar('Success', 'Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;
        Get.snackbar('Error', e.message ?? 'Verification failed');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        isLoading.value = false;
        //Get.to(() => OTPScreen());
        Get.toNamed(RoutesName.otpVerifyScreen);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  void verifyOTP(String smsCode) async {
    isLoading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String login = verificationId.value.toString();
      sharedPreferences.setString('login', login);
      isLoading.value = false;
      //Get.offAll(() => HomeScreen());
      Get.offAllNamed(RoutesName.notesScreen);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Invalid OTP');
    }
  }
}

