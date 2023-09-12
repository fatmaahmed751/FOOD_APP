import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
 // Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 30.h, bottom: 10.h, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         const SizedBox(width: 15,),
          // IconButton(onPressed: (){
          //   Navigator.pop(context);
          // }, icon:const Icon(Icons.arrow_back_ios)),
          CustomText(
            text: title,
            size: AppFontSize.s20,
            fontWeight: AppFontWeight.meduim,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 22,
              ))
        ],
      ),
    );
  }
}
