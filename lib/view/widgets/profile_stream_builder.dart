import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';

import '../../resources/components/loading_animation_submit.dart';
import '../../utils/app_util.dart';

class ProfileStreamBuilder extends StatefulWidget {
  const ProfileStreamBuilder({super.key});

  @override
  State<ProfileStreamBuilder> createState() => _ProfileStreamBuilderState();
}

class _ProfileStreamBuilderState extends State<ProfileStreamBuilder> {
  final _fireStore = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _fireStore,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingAnimationSubmit();
          }
          if (snapshot.hasError) {
            return AppUtil().showToastMessage('Error');
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Profile not found'));
          }
          var data = snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${data['name']}',
                style: const TextStyle(
                  fontFamily: AppFontStyle.amaranth,
                  fontSize: 18,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                'Email: ${data['email']}',
                style: const TextStyle(
                  fontFamily: AppFontStyle.amaranth,
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                'Phone: ${data['phone']}',
                style: const TextStyle(
                  fontFamily: AppFontStyle.amaranth,
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          );
        });
  }
}
