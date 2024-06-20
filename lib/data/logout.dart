import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/routes/routes_name.dart';

class Logout {
  final _auth = FirebaseAuth.instance;

  Future<void> logOut() async{
    await _auth.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    Get.offAllNamed(RoutesName.loginScreen);
  }
}