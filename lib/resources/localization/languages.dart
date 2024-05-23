import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/fonts/english_font.dart';
import 'package:noteapp_firebase/responsive_widget.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'english_language' : 'English',
      'bangla_language' : 'Bangla',
    },

    'bn_BD' : {
      'english_language' : 'ইংলিশ',
      'bangla_language' : 'বাংলা',
    },

  };
}