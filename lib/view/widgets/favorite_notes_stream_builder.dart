import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../resources/colors/app-colors.dart';
import '../../resources/components/loading_animation_submit.dart';
import '../../resources/fonts/app_font_style.dart';
import '../../resources/routes/routes_name.dart';
import '../../utils/app_util.dart';
import '../../view_models/controller/theme_controller.dart';
import '../../view_models/controller/view_controller.dart';

class FavoriteNotesStreamBuilder extends StatefulWidget {
  const FavoriteNotesStreamBuilder({super.key});

  @override
  State<FavoriteNotesStreamBuilder> createState() => _FavoriteNotesStreamBuilderState();
}

class _FavoriteNotesStreamBuilderState extends State<FavoriteNotesStreamBuilder> {
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

  final ViewController viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore,
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingAnimationSubmit();
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No favorite notes found'));
          }
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                if(viewController.viewType.value == 'Grid view'){
                  return GridView.builder(
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
                                onTap: () {
                                  Get.toNamed(RoutesName.showNotesScreen, arguments: {
                                    'notes-id':
                                    snapshot.data!.docs[index]['id'].toString(),
                                    'note-title': snapshot
                                        .data!.docs[index]['note-title']
                                        .toString(),
                                    'note-content': snapshot
                                        .data!.docs[index]['note-content']
                                        .toString(),
                                  });
                                },
                                title: Text(
                                  snapshot.data!.docs[index]['note-title'].toString(),
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
                                          AppUtil().showToastMessage('Note deleted');
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
                                        if (snapshot.data!.docs[index]['favorite'] ==
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
                  );
                }else if (viewController.viewType.value == 'List view'){
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: AppColors.cardBackgroundColor[
                          index % AppColors.cardBackgroundColor.length],
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Get.toNamed(RoutesName.showNotesScreen, arguments: {
                                    'notes-id':
                                    snapshot.data!.docs[index]['id'].toString(),
                                    'note-title': snapshot
                                        .data!.docs[index]['note-title']
                                        .toString(),
                                    'note-content': snapshot
                                        .data!.docs[index]['note-content']
                                        .toString(),
                                  });
                                },
                                title: Text(
                                  snapshot.data!.docs[index]['note-title'].toString(),
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
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    snapshot.data!.docs[index]['note-content']
                                        .toString(),
                                    maxLines: 3,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.whiteColor,
                                      fontFamily: AppFontStyle.amaranth,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                                          AppUtil().showToastMessage('Note deleted');
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
                                        if (snapshot.data!.docs[index]['favorite'] ==
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
                            ],
                          ),
                        );
                      });
                } else{
                  return GridView.builder(
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
                                onTap: () {
                                  Get.toNamed(RoutesName.showNotesScreen, arguments: {
                                    'notes-id':
                                    snapshot.data!.docs[index]['id'].toString(),
                                    'note-title': snapshot
                                        .data!.docs[index]['note-title']
                                        .toString(),
                                    'note-content': snapshot
                                        .data!.docs[index]['note-content']
                                        .toString(),
                                  });
                                },
                                title: Text(
                                  snapshot.data!.docs[index]['note-title'].toString(),
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
                                          AppUtil().showToastMessage('Note deleted');
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
                                        if (snapshot.data!.docs[index]['favorite'] ==
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
                  );
                }
              },),
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
          /*return Padding(
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
                          onTap: () {
                            Get.toNamed(RoutesName.showNotesScreen, arguments: {
                              'notes-id':
                              snapshot.data!.docs[index]['id'].toString(),
                              'note-title': snapshot
                                  .data!.docs[index]['note-title']
                                  .toString(),
                              'note-content': snapshot
                                  .data!.docs[index]['note-content']
                                  .toString(),
                            });
                          },
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
          );*/
        });
  }
}
