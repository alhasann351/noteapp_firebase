import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteapp_firebase/utils/app_util.dart';
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
        AppUtil().showToastMessage('Verification completed');
        //Get.snackbar('Success', 'Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;
        AppUtil().showToastMessage('Verification failed');
        //Get.snackbar('Error', e.message ?? 'Verification failed');
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
      AppUtil().showToastMessage('Invalid OTP');
      //Get.snackbar('Error', 'Invalid OTP');
    }
  }
}

