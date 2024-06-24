import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/components/app_drawer.dart';
import 'package:noteapp_firebase/resources/components/exit_dialog.dart';
import 'package:noteapp_firebase/resources/components/loading_animation_submit.dart';
import 'package:noteapp_firebase/resources/components/no_internet_alert_dialog.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/resources/routes/routes_name.dart';
import 'package:noteapp_firebase/utils/app_util.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final ThemeController themeController = Get.put(ThemeController());
  ExitDialog exitDialog = ExitDialog();

  final dynamic _fireStore = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes')
      .orderBy('id', descending: true)
      .snapshots();

  CollectionReference _reference = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    print('object');
    return PopScope(
      canPop: false,
      onPopInvoked: ((didPop) {
        if (didPop) {
          return;
        }
        exitDialog.showExitDialog(context);
      }),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Image.asset(
                  ImageIconAssets.drawerIcon,
                  width: 30,
                ));
          }),
          title: const Text(
            'Notes App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontStyle.amaranth,
            ),
          ),
        ),
        drawer: AppDrawer(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _fireStore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingAnimationSubmit();
                  }
                  if (snapshot.hasError) {
                    return AppUtil().showToastMessage('Error');
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No notes found'));
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                      padding: const EdgeInsets.only(
                                          top: 4, bottom: 8),
                                      child: Text(
                                        snapshot
                                            .data!.docs[index]['note-content']
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Get.toNamed(RoutesName.updateNotesScreen);
                                          },
                                          child: const CircleAvatar(
                                            child: Icon(Icons.edit_note),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _reference
                                                .doc(snapshot
                                                    .data!.docs[index]['id']
                                                    .toString())
                                                .delete()
                                                .then((value) {
                                              AppUtil().showToastMessage('Note deleted');
                                            }).onError((error, stackTrace) {
                                              AppUtil().showToastMessage(
                                                  'Note not deleted');
                                            });
                                          },
                                          child: const CircleAvatar(
                                            child: Icon(Icons.delete_forever),
                                          ),
                                        ),
                                        const CircleAvatar(
                                          child: Icon(
                                              Icons.favorite_border_rounded),
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
                    ),
                    /*ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          title: Text(snapshot.data!.docs[index]['note-title']
                              .toString()),
                          subtitle: Text(snapshot
                              .data!.docs[index]['note-content']
                              .toString()),
                        );
                      },
                    ),*/
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(RoutesName.addNotesScreen);
            },
            backgroundColor: AppColors.commonColor,
            elevation: 10,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
                child: Image.asset(
              ImageIconAssets.addNotesIcon,
              width: 30,
            ))),
      ),
    );
  }
}
