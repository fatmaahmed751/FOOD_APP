import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/widgets/menu_category_item.dart';
import 'package:restaurant_app/widgets/menu_category_view.dart';

import '../screens/desserts_screen.dart';
class MenuCategoriesSection extends StatelessWidget {
  const MenuCategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 90.w,
            height: 430.h,
            decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
              children: [
                InkWell(
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>const DessertsScreen()));
                  },
                  child: MenuCategoryItem(title:'Desserts' ,subTitle: '120 items',
                  image:('assets/images/desserts.png')),
                ),
              //  SizedBox(height: 10.h,),
                InkWell(
                  child: MenuCategoryItem(title: 'Beverages',subTitle: '120 items',
                      image:('assets/images/beverages.png')),
                ),
               // SizedBox(height: 10.h,),
                MenuCategoryItem(title: 'Food',subTitle: '120 items',
                    image:('assets/images/food.png')),
                //SizedBox(height: 10.h,),
                MenuCategoryItem(title: 'Promotions',subTitle: '120 items',
                    image:('assets/images/promotions.png')),

              ]),
        )
      ],
    );
  }
}
