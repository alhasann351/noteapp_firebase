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
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/resources/routes/routes_name.dart';
import 'package:noteapp_firebase/utils/app_util.dart';
import 'package:noteapp_firebase/view/widgets/stream_builder_widget.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  ExitDialog exitDialog = ExitDialog();

  @override
  Widget build(BuildContext context) {
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
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilderWidget(),
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
