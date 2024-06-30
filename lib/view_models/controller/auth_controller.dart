import 'package:cloud_firestore/cloud_firestore.dart';
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
        Get.toNamed(RoutesName.otpVerifyScreen, arguments: {
          'number': phoneNumber,
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  void verifyOTP(String smsCode, String number) async {
    isLoading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String login = verificationId.value.toString();
      sharedPreferences.setString('login', login);
      isLoading.value = false;
      //Get.offAll(() => HomeScreen());
      Future<bool> isNewUser(User user) async {
        DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        return !doc.exists;
      }
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          bool isNew = await isNewUser(user);
          if (isNew) {
            // User is new
            final _fireStore = FirebaseFirestore.instance.collection('users');
            _fireStore.doc(FirebaseAuth.instance.currentUser!.uid).set({
              'name' : '',
              'email' : '',
              'phone' : number,
              'password' : '',
            }).onError((error, stackTrace){
              AppUtil().showToastMessage('Phone number not upload in server');
            });
            Get.offAllNamed(RoutesName.notesScreen);
          } else {
            // Existing user
            Get.offAllNamed(RoutesName.notesScreen);
          }
        }
      });


    } catch (e) {
      isLoading.value = false;
      AppUtil().showToastMessage('Invalid OTP');
      //Get.snackbar('Error', 'Invalid OTP');
    }
  }
}

