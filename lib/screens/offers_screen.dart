import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/custom_app_bar_two.dart';
import 'package:restaurant_app/widgets/custom_text.dart';
import 'package:restaurant_app/widgets/popular_restaurant.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            const CustomAppBarTwo(
              title: 'Latest Offers',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 65),
              child: CustomText(
                  text: 'Find discounts,'
                      ' Offers special meals and more !',
                  color: AppColors.lightGrey,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  heigtText: 1.5),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200.0, left: 18),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                // padding: const EdgeInsets.only(right: 200.0),
                width: 165,
                height: 35,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(100.0),
                ),

                child: const Center(
                  child: Text(
                    'Check Offers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            PopularRestaurant(),
          ],
        ),
      ),
    );
  }


}
