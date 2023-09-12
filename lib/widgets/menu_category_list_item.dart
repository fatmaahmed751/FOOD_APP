import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_text.dart';

class MenuCategoryListItem extends StatelessWidget {
  const MenuCategoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: context.width,
      height: 190.h,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        // color: Colors.white,
      //  image: DecorationImage(image: AssetImage(dessert), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: 'French Apple Pie',
             // color: AppColors.whiteColor,
              size: AppFontSize.s16,
              fontWeight: AppFontWeight.bold,
            ),
            //

          ],
        ),
      ),
    );
  }
}
