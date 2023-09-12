import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final double? fontText;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    this.fontText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        width: 270.sp,
        height: 55.sp,
        child: Center(
          child: CustomText(
            text: text,
            color: textColor,
            size: fontText,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
