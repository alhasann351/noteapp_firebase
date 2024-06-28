import 'package:flutter/material.dart';
import 'package:noteapp_firebase/view/widgets/favorite_notes_stream_builder.dart';
import '../resources/fonts/app_font_style.dart';

class FavoriteNotesScreen extends StatefulWidget {
  const FavoriteNotesScreen({super.key});

  @override
  State<FavoriteNotesScreen> createState() => _FavoriteNotesScreenState();
}

class _FavoriteNotesScreenState extends State<FavoriteNotesScreen> {

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
      body: const FavoriteNotesStreamBuilder(),
    );
  }
}
