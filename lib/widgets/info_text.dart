import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
                  text:
                      'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep',
                  size: 13.sp,
                  textAlign: TextAlign.center,
                );
  }
}