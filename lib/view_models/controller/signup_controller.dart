import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loadingAnimation = false.obs;

  final _auth = FirebaseAuth.instance;

  final _fireStore = FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    nameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    super.dispose();
  }

  void signUp() {
    loadingAnimation.value = true;

    _auth.createUserWithEmailAndPassword(
      email: emailController.value.text.toString(),
      password: passwordController.value.text.toString(),
    ).then((value){
      String _id = DateTime.now().millisecondsSinceEpoch.toString();
      _fireStore.doc(_id).set({
        'name' : nameController.value.text.toString(),
        'email' : emailController.value.text.toString(),
        'password' : passwordController.value.text.toString(),
      }).then((value){
        loadingAnimation.value = false;
      });
      loadingAnimation.value = false;
    });
  }
}
