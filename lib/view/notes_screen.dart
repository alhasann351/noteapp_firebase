import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/assets/image_icon_assets.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/components/app_drawer.dart';
import 'package:noteapp_firebase/resources/fonts/app_font_style.dart';
import 'package:noteapp_firebase/resources/routes/app_routes.dart';
import 'package:noteapp_firebase/resources/routes/routes_name.dart';
import 'package:noteapp_firebase/view/widgets/no_internet_alert_dialog.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) =>
                      const NoInternetAlertDialog());
            },
            child: const Text('Show')),
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
    );
  }
}
