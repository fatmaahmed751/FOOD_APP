import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_text.dart';

class CustomAppBarTwo extends StatelessWidget {
  const CustomAppBarTwo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(top:5.h, bottom: 10.h, right: 20.w),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back_ios,size: 20,)),
          CustomText(
            text: title,
            size: AppFontSize.s20,
            color: Color(0xff4A4B4D),
            fontWeight: AppFontWeight.meduim,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 22,
              //  color: Colors.white,
              ))

        ],
      ),
    );
  }
}
