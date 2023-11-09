import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
        return Scaffold(
         backgroundColor: AppColors.backgroundColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: bottomNavCurrentIndex == 2
                ? AppColors.kPrimaryColor
                : AppColors.labelColor,
            foregroundColor: Colors.white,
            onPressed: () {
              cubit.changeBottomNav(2);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset("assets/images/svg_images/home.svg"),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const CircularNotchedRectangle(),
            notchMargin: 12,
            elevation: 30,
            // height: 70,
            child: BottomNavigationBar(
              elevation: 7.0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.kPrimaryColor,
              unselectedItemColor: AppColors.labelColor,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: bottomNavCurrentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_images/menu.svg",
                    color: cubit.bottomNavCurrentIndex == 0
                        ? AppColors.kPrimaryColor
                        : AppColors.labelColor,
                  ),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon:SvgPicture.asset("assets/images/svg_images/shopping.svg",
                    color: cubit.bottomNavCurrentIndex == 1
                        ? AppColors.kPrimaryColor
                        : AppColors.labelColor,
                  ),
                  label: 'Offers',
                ),
                // BottomNavigationBarItem(
                //   icon: SvgPicture.asset("assets/images/svg_images/home.svg",
                //     color: cubit.bottomNavCurrentIndex == 2
                //         ? AppColors.kPrimaryColor
                //         : AppColors.labelColor,
                //   ),
                //   label: 'home',
                // ),
                 const BottomNavigationBarItem(
                     icon: Icon(Icons.circle), label: ''),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_images/man.svg",
                    color: cubit.bottomNavCurrentIndex == 3
                        ? AppColors.kPrimaryColor
                        : AppColors.labelColor,
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_images/more.svg",
                    color: cubit.bottomNavCurrentIndex == 4
                        ? AppColors.kPrimaryColor
                        : AppColors.labelColor,
                  ),
                  label: 'More',
                ),
              ],
            ),
          ),
          body: cubit.bottomScreens[cubit.bottomNavCurrentIndex]
          // IndexedStack(
          //   index: bottomNavCurrentIndex,
          //   children: cubit.bottomScreens,
          // ),
        );
      },
    );
  }
}
