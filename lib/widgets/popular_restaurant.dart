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
      //height:MediaQuery.of(context).size.height,
     // height: 500.h,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => offerSFood(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 9,
              ),
          itemCount: 5),
    );
  }

  Widget offerSFood() =>
      Padding(
        padding: const EdgeInsets.only(left: 0.0,bottom:0,right: 0),
        child: Column(
          children: [
            Card(
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              margin: const EdgeInsets.only(bottom:10.0),
              child: Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                   // color: Colors.yellow,

                    // color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset(
                  'assets/images/choco.jpg',
                 // width: double.infinity,
                fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: 'French Apple Pie',
                  color: Colors.black,
                  size: AppFontSize.s18,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
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
            ),
          ],
        ),
      );
}
