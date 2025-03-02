import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/custom_app_bar_two.dart';
import 'package:restaurant_app/widgets/custom_text.dart';
import 'package:restaurant_app/widgets/popular_restaurant.dart';

import '../controllers/app_bloc/cubit.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restaurants = AppCubit
        .get(context)
        .restaurantModel;

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
            Container(
              //color:Colors.red,
              //height:MediaQuery.of(context).size.height,
              //height: 900.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => offerSFood(restaurants[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 9,
                  ),
                  itemCount: restaurants.length),
            ),
            //PopularRestaurant(),
          ],
        ),
      ),
    );
  }

  Widget offerSFood(restaurants) => Padding(
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
            child: Image.network(
              '${restaurants.image}',
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: CustomText(
              text: '${restaurants.name}',
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
                text: '${restaurants.rate}',
                color: AppColors.kPrimaryColor,
                size: AppFontSize.s12,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: '(${restaurants.rateNumber})',
                color: AppColors.lightGrey,
                size: AppFontSize.s15,
              ),
              const SizedBox(
                width: 3,
              ),
              CustomText(
                text: '${restaurants.type}',
                color: AppColors.lightGrey,
                size: AppFontSize.s15,
              ),
              const SizedBox(
                width: 3,
              ),Container(
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
                text: '${restaurants.categoryName}',
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
