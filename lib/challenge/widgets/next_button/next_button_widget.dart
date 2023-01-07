import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonStyleEnum { outline, confirm }

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWidget(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.onTap});

  NextButtonWidget.outline(
      {super.key,
      required this.label,
      required this.onTap,
      bool noBorder = false})
      : backgroundColor = noBorder ? Colors.transparent : AppColors.white,
        borderColor = noBorder ? Colors.transparent : AppColors.border,
        fontColor = AppColors.grey;

  NextButtonWidget.confirm(
      {super.key, required this.label, required this.onTap})
      : backgroundColor = AppColors.darkGreen,
        borderColor = AppColors.green,
        fontColor = AppColors.white;

  NextButtonWidget.share({super.key, required this.label, required this.onTap})
      : backgroundColor = AppColors.darkGreen,
        borderColor = AppColors.green,
        fontColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            side: MaterialStateProperty.all(BorderSide(color: borderColor)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            )),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
