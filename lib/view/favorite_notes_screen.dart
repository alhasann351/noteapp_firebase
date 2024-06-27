import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:noteapp_firebase/resources/components/loading_animation_submit.dart';
import 'package:noteapp_firebase/resources/components/rounded_button.dart';
import '../resources/colors/app-colors.dart';
import '../resources/fonts/app_font_style.dart';
import '../resources/routes/routes_name.dart';
import '../resources/strings/app_stings.dart';
import '../utils/app_util.dart';
import '../view_models/controller/theme_controller.dart';

class FavoriteNotesScreen extends StatefulWidget {
  const FavoriteNotesScreen({super.key});

  @override
  State<FavoriteNotesScreen> createState() => _FavoriteNotesScreenState();
}

class _FavoriteNotesScreenState extends State<FavoriteNotesScreen> {
  final ThemeController themeController = Get.put(ThemeController());

  final dynamic _fireStore = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes')
      .where('favorite', isEqualTo: "true")
      .orderBy('id', descending: true)
      .snapshots();

  final CollectionReference _reference = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: const Text(
          'Favorite Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: AppFontStyle.amaranth,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _fireStore,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingAnimationSubmit();
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No favorite notes found'));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  mainAxisExtent: 280,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.cardBackgroundColor[
                        index % AppColors.cardBackgroundColor.length],
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              snapshot.data!.docs[index]['note-title']
                                  .toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.whiteColor,
                                fontFamily: AppFontStyle.amaranth,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 8),
                              child: Text(
                                snapshot.data!.docs[index]['note-content']
                                    .toString(),
                                maxLines: 7,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppFontStyle.amaranth,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RoutesName.updateNotesScreen,
                                        arguments: {
                                          'note-id': snapshot
                                              .data!.docs[index]['id']
                                              .toString(),
                                          'note-title': snapshot
                                              .data!.docs[index]['note-title']
                                              .toString(),
                                          'note-content': snapshot
                                              .data!.docs[index]['note-content']
                                              .toString(),
                                        });
                                  },
                                  child: const CircleAvatar(
                                    child: Icon(Icons.edit_note),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _reference
                                        .doc(snapshot.data!.docs[index]['id']
                                            .toString())
                                        .delete()
                                        .then((value) {
                                      AppUtil()
                                          .showToastMessage('Note deleted');
                                    }).onError((error, stackTrace) {
                                      AppUtil()
                                          .showToastMessage('Note not deleted');
                                    });
                                  },
                                  child: const CircleAvatar(
                                    child: Icon(Icons.delete_forever),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (snapshot.data!.docs[index]
                                            ['favorite'] ==
                                        'false'.toString()) {
                                      _reference
                                          .doc(snapshot.data!.docs[index]['id']
                                              .toString())
                                          .update({
                                        'favorite': 'true',
                                      }).then((value) {
                                        AppUtil().showToastMessage(
                                            'Note added in favorite');
                                      }).onError((error, stackTrace) {
                                        AppUtil().showToastMessage(
                                            'Note not added in favorite');
                                      });
                                    } else {
                                      _reference
                                          .doc(snapshot.data!.docs[index]['id']
                                              .toString())
                                          .update({
                                        'favorite': 'false',
                                      }).then((value) {
                                        AppUtil().showToastMessage(
                                            'Note remove in favorite');
                                      }).onError((error, stackTrace) {
                                        AppUtil().showToastMessage(
                                            'Note not remove in favorite');
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    child: snapshot.data!.docs[index]
                                                ['favorite'] ==
                                            'true'.toString()
                                        ? const Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite_border_rounded,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
