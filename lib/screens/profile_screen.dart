import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

import '../controllers/register_cubit/register_cubit.dart';
import '../controllers/register_cubit/register_state.dart';
import '../models/register_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  //var nameController = TextEditingController();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserRegisterModel registerModel = UserRegisterModel(

  );
  var nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confiemPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<HomeCubit, HomeState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     var cubit = HomeCubit.get(context);
    //     var bottomNavCurrentIndex = cubit.bottomNavCurrentIndex;
    return  BlocConsumer<AppRegisterCubit,RegisterStates>(
      listener: (context,state){},
     builder: (context,state){
       AppRegisterCubit cubit = AppRegisterCubit.get(context);
       var userModel = AppRegisterCubit.get(context).registerModel;
       nameController.text = userModel.name!;
       emailController.text = userModel.email;
       UserRegisterModel userRegisterModel=UserRegisterModel(
       );
       return Scaffold(
         body: SingleChildScrollView(
           child: Column(
             children: [
               const CustomAppBar(
                 title: 'Profile',
               ),
               Center(
                   child: CircleAvatar(
                       backgroundColor: Colors.black12,
                       radius: 50,
                       child: Stack(alignment: Alignment.bottomRight, children: [
                         // Image(image: AssetImage('assets/images/logo.png')),
                         SvgPicture.asset("assets/images/svg_images/man.svg",
                           width: 50,),
                         IconButton(
                             onPressed: () {},
                             icon: Icon(Icons.camera_alt_outlined))
                       ]))),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   IconButton(
                       onPressed: () {},
                       icon: const Icon(
                         Icons.edit_outlined,
                         color: Colors.deepOrange,
                       )),
                   const Text(
                     'Edit Profile',
                     style: TextStyle(
                         color: Colors.deepOrange, fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
               screenSubText(
                   text: 'Hi there ${userModel.name}',
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: const Color(0xff4A4B4D)),
               const SizedBox(
                 height: 10,
               ),
               screenSubText(
                   text: 'Sign out',
                   fontSize: 11,
                   fontWeight: FontWeight.w500,
                   color: const Color(0xff7C7D7E)),
               const SizedBox(
                 height: 15,
               ),
               defaultFormField(
                   prefixIcon: Icon(
                     Icons.person,
                     color: AppColors.kPrimaryColor,
                   ),
                   labelText: ('Name'),
                   hintText: 'Name',
                   type: TextInputType.text,
                   controller: nameController),
               defaultFormField(
                   prefixIcon: Icon(
                     Icons.email_outlined,
                     color: AppColors.kPrimaryColor,
                   ),
                   labelText: ('Email'),
                   hintText: 'Email',
                   type: TextInputType.text,
                 controller:emailController,
                   //value: userModel.email,
                   ),
               defaultFormField(
                   prefixIcon: Icon(
                     Icons.phone_android_outlined,
                     color: AppColors.kPrimaryColor,
                   ),
                   labelText: ('Mobile'),
                   hintText: 'Mobile No',
                   type: TextInputType.text,
                   controller: phoneController),
               defaultFormField(
                   prefixIcon: Icon(
                     Icons.home,
                     color: AppColors.kPrimaryColor,
                   ),
                   labelText: ('Address'),
                   hintText: 'Address',
                   type: TextInputType.text,
                   controller: addressController),
               defaultFormField(
                   prefixIcon: Icon(
                     Icons.lock_outline,
                     color: AppColors.kPrimaryColor,
                   ),
                   labelText: ('Password'),
                   obscureText: true,
                   hintText: 'Password',
                   type: TextInputType.text,
                   controller: passwordController),
               defaultFormField(
                   prefixIcon: Icon(
                     Icons.lock_outline,
                     color: AppColors.kPrimaryColor,
                   ),
                   labelText: ('Confirm password'),
                   obscureText: true,
                   hintText: 'Confirm password',
                   type: TextInputType.text,
                   controller: confiemPasswordController,
                   suffixIcon: Icon(
                     Icons.visibility_off_outlined,
                     color: AppColors.kPrimaryColor,
                   )),
               orangeButton(
                 text: 'Save',
                 function: () {},
               ),
               /*IndexedStack(
            index: bottomNavCurrentIndex,
            children: cubit.bottomScreens,
        ),*/
             ],
           ),
         ),
         /* backgroundColor: AppColors.backgroundColor,
          floatingActionButton: FloatingActionButton(
      backgroundColor: bottomNavCurrentIndex == 2
          ? AppColors.primaryColor
          : AppColors.labelColor,
      foregroundColor: Colors.white,
      onPressed: () {
        cubit.changeBottomNav(2);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(iconHome),
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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.labelColor,
        onTap: (index) {
          cubit.changeBottomNav(index);
        },
        currentIndex: bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconMenu,
              color: cubit.bottomNavCurrentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.labelColor,
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconShopping,
              color: cubit.bottomNavCurrentIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.labelColor,
            ),
            label: 'Offers',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.circle), label: ''),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconProfile,
              color: cubit.bottomNavCurrentIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.labelColor,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconMore,
              color: cubit.bottomNavCurrentIndex == 4
                  ? AppColors.primaryColor
                  : AppColors.labelColor,
            ),
            label: 'More',
          ),
        ],
      ),
          ),*/
       );
     },
    );
  }
}
