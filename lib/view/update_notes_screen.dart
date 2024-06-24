import 'package:flutter/material.dart';

import '../resources/colors/app-colors.dart';
import '../resources/components/rounded_button.dart';
import '../resources/fonts/app_font_style.dart';
import '../resources/strings/app_stings.dart';

class UpdateNotesScreen extends StatefulWidget {
  const UpdateNotesScreen({super.key});

  @override
  State<UpdateNotesScreen> createState() => _UpdateNotesScreenState();
}

class _UpdateNotesScreenState extends State<UpdateNotesScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: const Text(
          'Update Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: AppFontStyle.amaranth,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    minLines: 2,
                    maxLines: 2,
                    cursorColor: AppColors.blackColor,
                    style: const TextStyle(color: AppColors.blackColor),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffix: const Text('Note title'),
                      suffixStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: AppFontStyle.amaranth,
                        fontSize: 18,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: AppStrings.updateNoteTitle,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter note title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    maxLines: 15,
                    minLines: 15,
                    cursorColor: AppColors.blackColor,
                    style: const TextStyle(color: AppColors.blackColor),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffix: const Text('Write note'),
                      suffixStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: AppFontStyle.amaranth,
                        fontSize: 18,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: AppStrings.updateNoteContent,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter note content';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: RoundedButton(
                title: AppStrings.noteUpdate,
                backgroundColor: AppColors.buttonColor,
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontStyle.amaranth,
                  color: AppColors.whiteColor,
                ),
                onTap: () {

                },
              ),),
          ],
        ),
      ),
    );
  }
}
