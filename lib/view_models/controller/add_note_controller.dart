import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/utils/app_util.dart';

class AddNoteController extends GetxController{
  final _firestore = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
  final noteTitleController = TextEditingController().obs;
  final noteContentController = TextEditingController().obs;
  RxBool loadingAnimation = false.obs;

  void saveNote(){
    loadingAnimation.value = true;

    String _id = DateTime.now().millisecondsSinceEpoch.toString();

    _firestore.collection('notes').doc(_id).set({
      'id': _id,
      'note-title': noteTitleController.value.text.toString(),
      'note-content': noteContentController.value.text.toString(),
      'favorite': 'false',
      //'timestamp': FieldValue.serverTimestamp(),
    }).then((value){
      loadingAnimation.value = false;
      AppUtil().showToastMessage('Save successfully');
    }).onError((error, stackTrace){
      loadingAnimation.value = false;
      AppUtil().showToastMessage('Not save');
    });

  }
}