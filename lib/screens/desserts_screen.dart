import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/models/dessert_model.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/custom_app_bar_two.dart';
import 'package:restaurant_app/widgets/custom_text.dart';
import 'package:restaurant_app/widgets/search_bar.dart';

import '../controllers/app_bloc/states.dart';

class DessertsScreen extends StatelessWidget {
  const DessertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
           var desserts = AppCubit.get(context).dessertsModel;
         return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  const CustomAppBarTwo(
                    title: 'Desserts',
                  ),
                  const SearchBarWidget(),
                  Container(
                   // height: 800.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => dessertContainer(desserts[index]),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 4,
                        ),
                        itemCount: desserts.length,
                  )
                  )
                ],
              ),
            ),
          );

        }
    );
  }

  Widget dessertContainer(desserts
    //  DessertsModel dessertsModel
      ) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                 // color: Colors.orange,
                borderRadius: BorderRadius.circular(20)
              ),
              child:Image.network(
                '${desserts.image}',
                //'assets/images/choco.jpg',
                //height: 193.h,
                 fit: BoxFit.cover,
              ),
            ),

            // SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                   Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomText(
                      text:  '${desserts.name}',
                      color: AppColors.whiteColor,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.kPrimaryColor,
                      ),
                      CustomText(
                        text:  '${desserts.rate}',
                        color: AppColors.whiteColor,
                        size: AppFontSize.s16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text:  '${desserts.categoryName}',
                        color: AppColors.whiteColor,
                        size: AppFontSize.s15,
                        fontWeight: AppFontWeight.meduim,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
