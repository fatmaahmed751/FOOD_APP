import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/screens/item_details.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/custom_text.dart';
import 'package:restaurant_app/widgets/popular_restaurant.dart';
import 'package:restaurant_app/widgets/search_bar.dart';
import 'package:geolocator/geolocator.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                //  scrollDirection = Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomAppBar(
                      title: 'Good Morning Fatma!',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Delivering to',
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB6B7B7)),
                          ),
                          Row(
                            children: [
                              Text(
                                'Current Location',
                                // textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.lightGrey),
                              ),
                              Center(
                                child: IconButton(
                                  onPressed: ()async {
                                 await cubit.getPosition();
                                  },
                                  icon: Icon(Icons.arrow_drop_down_sharp,
                                      size: 30, color: AppColors.kPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SearchBarWidget(),
                    Container(
                      height: 115,
                      // color: Colors.yellow,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              Container(
                                // width: 254,
                                height: 100,
                                // padding: const EdgeInsets.only(left:7),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/order.png',
                                      ),
                                      height: 95,
                                    ),
                                    Text('italian')
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 3,
                          ),
                          itemCount: 6),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 13),
                      child: Row(
                        children: [
                          CustomText(text: 'Popular Restaurant',
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeight.meduim,
                            size: AppFontSize.s18,),
                          const Spacer(),
                          CustomText(text: 'View All',
                            color: AppColors.kPrimaryColor,
                            size: AppFontSize.s14,
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 3,
                    // ),
                    const PopularRestaurant(),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                      child: Row(
                        children: [
                          CustomText(text: 'Recent Items',
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeight.meduim,
                            size: AppFontSize.s18,),
                          const Spacer(),
                          CustomText(text: 'View All',
                            color: AppColors.kPrimaryColor,
                            size: AppFontSize.s14,
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,

                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Container(
                            height: 100,
                            padding: const EdgeInsets.only(left: 5),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>const ItemDetails()));
                              },
                              child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/order.png',
                                      ),
                                      height: 95,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              'King Burgers',
                                              style:
                                              TextStyle(
                                                  color: Color(0xff4A4B4D),
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.deepOrange,
                                                  size: 20,
                                                ),
                                                Text(
                                                  '4.9',
                                                  style: TextStyle(
                                                      color: Colors.deepOrange,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  '(124 ratings)',
                                                  style: TextStyle(
                                                      color: Color(0xff4A4B4D),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Burger',
                                                  style: TextStyle(
                                                      color: Color(0xff4A4B4D),
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  '.Westem Food',
                                                  style: TextStyle(
                                                      color: Color(0xff4A4B4D),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ]
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                      itemCount: 4,
                    )
                  ]
              ),
            )
        );

      }
    );
  //  );
  }
}
