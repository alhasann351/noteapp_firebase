import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewController extends GetxController {
  var viewType = 'Grid view'.obs;

  @override
  void onInit() {
    super.onInit();
    loadViewType();
  }

  void updateView(String newView) async {
    viewType.value = newView;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('viewType', newView);
  }

  void loadViewType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedViewType = prefs.getString('viewType');
    if (savedViewType != null) {
      viewType.value = savedViewType;
    }
  }
  /*var viewType = 'Grid (small)'.obs;

  void updateView(String newView) async{
    viewType.value = newView;
  }*/
}
