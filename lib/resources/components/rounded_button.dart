import 'package:flutter/material.dart';
import 'package:noteapp_firebase/resources/colors/app-colors.dart';
import 'package:noteapp_firebase/resources/components/loading_animation.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool loading;
  final TextStyle? textStyle;
  final Color backgroundColor;

  const RoundedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false,
      this.textStyle,
      this.backgroundColor = AppColors.primaryLightColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap!();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6,
      ),
      child: loading ? const LoadingAnimation() : Text(title, style: textStyle,),
    );
  }
}
