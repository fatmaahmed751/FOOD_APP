import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_text.dart';

class PopularRestaurant extends StatelessWidget {
  const PopularRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => offerSFood(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 9,
              ),
          itemCount: 5),
    );
  }

  Widget offerSFood() => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/choco.jpg',
              width: double.infinity,
              height: 193.h,
            ),
            const SizedBox(
              height: 4,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: CustomText(
                text: 'French Apple Pie',
                color: Colors.black,
                size: AppFontSize.s18,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: AppColors.kPrimaryColor,
                ),
                CustomText(
                  text: '4.9',
                  color: AppColors.kPrimaryColor,
                  size: AppFontSize.s12,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  text: 'Minute by tuk tuk',
                  color: AppColors.lightGrey,
                  size: AppFontSize.s15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 3,
                ),
                CustomText(
                  text: 'Western Food',
                  color: AppColors.lightGrey,
                  size: AppFontSize.s15,
                ),
              ],
            ),
          ],
        ),
      );
}
