import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/localization/languages.dart';
import 'package:noteapp_firebase/resources/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noteapp_firebase/resources/themes/themes.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        theme: themes.lightTheme,
        darkTheme: themes.darkTheme,
        themeMode: themeController.theme,
        getPages: AppRoutes.appRoutes(),
      );
    });
  }
}
