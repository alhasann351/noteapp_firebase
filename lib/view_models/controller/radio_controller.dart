// lib/controllers/radio_controller.dart
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RadioController extends GetxController {
  RxString selectedValue = 'No Selected'.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
