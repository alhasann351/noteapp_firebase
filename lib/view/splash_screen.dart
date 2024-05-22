import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/components/loading_animation.dart';
import 'package:noteapp_firebase/responsive_widget.dart';
import 'package:noteapp_firebase/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.lightSplashColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveWidget(
              mobile: Expanded(
                  child: LottieBuilder.asset(
                'assets/lotties/Animation - 1716331126656.json',
                width: 250,
                height: 250,
              )),
              tab: Expanded(
                  child: LottieBuilder.asset(
                'assets/lotties/Animation - 1716331126656.json',
                width: 350,
                height: 350,
              )),
              desktop: Expanded(
                  child: LottieBuilder.asset(
                'assets/lotties/Animation - 1716331126656.json',
                width: 450,
                height: 450,
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: LoadingAnimation(),
            ),
          ],
        ),
      ),
    );
  }
}
