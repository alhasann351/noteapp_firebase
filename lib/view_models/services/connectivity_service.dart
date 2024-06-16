import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:noteapp_firebase/view/widgets/no_internet_alert_dialog.dart';

class ConnectivityService extends GetxService{
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();

    InternetConnection().onStatusChange.listen((status) {
      switch(status){
        case InternetStatus.connected:
          isConnected.value = true;
          /*if(Get.isSnackbarOpen){
            Get.closeCurrentSnackbar();
          }*/
          if(Get.isDialogOpen!){
            Get.back();
          }
          break;
        case InternetStatus.disconnected:
          isConnected.value = false;
          Get.dialog(const NoInternetAlertDialog(), barrierDismissible: false);
          //Get.snackbar('No Internet', 'Check your internet connection', snackPosition: SnackPosition.BOTTOM, duration: const Duration(days: 1));
          break;
      }
    });
  }

  void _checkConnectivity() async{
    isConnected.value = await InternetConnection().hasInternetAccess;
  }
}