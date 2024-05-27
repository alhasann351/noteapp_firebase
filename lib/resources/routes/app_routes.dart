import 'package:get/get.dart';
import 'package:noteapp_firebase/resources/routes/routes_name.dart';
import 'package:noteapp_firebase/view/add_notes_screen.dart';
import 'package:noteapp_firebase/view/login_screen.dart';
import 'package:noteapp_firebase/view/login_with_phone_number.dart';
import 'package:noteapp_firebase/view/notes_screen.dart';
import 'package:noteapp_firebase/view/signup_screen.dart';
import 'package:noteapp_firebase/view/splash_screen.dart';
import 'package:noteapp_firebase/view/forgot_password_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.signupScreen,
          page: () => const SignupScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.notesScreen,
          page: () => const NotesScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.addNotesScreen,
          page: () => const AddNotesScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.forgotPasswordScreen,
          page: () => const ForgotPasswordScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250),
        ),
    GetPage(
      name: RoutesName.loginPhoneNumberScreen,
      page: () => const LoginWithPhoneNumber(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 250),
    ),
      ];
}
