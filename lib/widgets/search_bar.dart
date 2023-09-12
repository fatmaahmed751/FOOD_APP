import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: SizedBox(
        height: 45.h,
        width: double.infinity,
        child: TextFormField(
            //controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'search food',
              hintStyle:const TextStyle(
                  fontSize: AppFontSize.s14
                  ,fontWeight: AppFontWeight.regular,
                 // color: AppColors.grey,

              ),
              filled: true,
              fillColor: Colors.grey[200],
               prefixIcon: SvgPicture.asset(
                  'assets/images/icons/search.svg',
                  color: AppColors.grey,
                  fit: BoxFit.scaleDown
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:  BorderSide.none,
              ),
            ),
           // cursorColor: AppColors.grey,
            onTap: () {}),
      ),
    );
  }
}
