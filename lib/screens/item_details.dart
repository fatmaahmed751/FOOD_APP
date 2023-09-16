import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';

import '../widgets/custom_app_bar_two.dart';
import '../widgets/custom_text.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          color: Colors.yellow,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [

              Positioned(
                top: -24,
// color: Colors.yellow,
                width: 380.w,
 height: 300,
                child: Image.network(
                  'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
// fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 10.h, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.whiteColor,
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 22,
                          color: AppColors.whiteColor,
                        ))
                  ],
                ),
              ),
              Positioned(
                top: 220,
               // left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(42),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(2, 1),
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1),
                    ],
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        CustomText( text: 'Tandoori Chicken Pizza',),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: AppColors.kPrimaryColor,
                            ),
                            CustomText(
                              text:  '4 Star Ratings',
                              color: AppColors.kPrimaryColor,
                              size: AppFontSize.s16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Spacer(),
                            Column(
                              children: [
                                CustomText(text: 'Rs.750',
                                fontWeight: FontWeight.bold,
                                size: 25,
                                ),
                                CustomText(text: '/per Porition',
                                  fontWeight: FontWeight.normal,
                                  size: 12,
                                ),
                              ],
                            )
                          ],
                        ),
                        CustomText(
                          text:  'Description',
                          color: AppColors.blackColor,
                          size: AppFontSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height:10),
                        Container(
                          width: 316,
                          //height: 200,
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada'
                          ,
                            style: TextStyle(
                              //  overflow: TextOverflow.ellipsis,
                                height: 1.2,
                                fontSize: 14, color:AppColors.lightGrey),
                          ),
                        ),

                        SizedBox(height:10),
                        CustomText(
                          text:  'Customize your Order',
                          color: AppColors.blackColor,
                          size: AppFontSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
