import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_text.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(""),
          SizedBox(
           // height: context.height * 0.02,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Meal ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: AppFontWeight.bold,
                  //  color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'Monkey',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: AppFontWeight.bold,
                    //color: AppColors.blackColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
           // height: context.height * 0.01,
          ),
          CustomText(
            text: 'A Food Delivery',
            size: 12.sp,
            //color: AppColors.blackColor.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
