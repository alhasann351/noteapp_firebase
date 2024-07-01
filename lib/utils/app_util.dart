import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/view_models/controller/theme_controller.dart';

class AppUtil {
  final ThemeController themeController = Get.put(ThemeController());

  showSnackBarNo(String title, message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: themeController.isDarkMode.value
          ? AppColors.lightSnackbarBackgroundColor
          : AppColors.darkSnackbarBackgroundColor,
      colorText: AppColors.whiteColor,
    );
  }

  showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: themeController.isDarkMode.value ? AppColors.darkToastMessageBackgroundColor : AppColors.lightToastMessageBackgroundColor,
      textColor: AppColors.whiteColor,
    );
  }
}
