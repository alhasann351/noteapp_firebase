import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(title: Text('Notes App'),),
      drawer: Drawer(
        child: Column(
          children: [
            /*Row(
              children: [
                Text('Dark Mode'),

              ],
            )*/
            Obx((){
              return Switch(value: themeController.isDarkMode.value, onChanged: (value){
                themeController.switchTheme();
              });
            })
          ],
        ),
      ),
    );
  }
}
