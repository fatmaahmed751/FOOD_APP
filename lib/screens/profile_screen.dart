import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

import '../controllers/login_bloc/login_cubit.dart';
import '../controllers/login_bloc/login_state.dart';
import '../controllers/register_cubit/register_cubit.dart';
import '../controllers/register_cubit/register_state.dart';
import '../models/register_model.dart';
import '../widgets/custom_app_bar_two.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key,}) : super(key: key);
  //var nameController = TextEditingController();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // Stream documentStream = FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();
  //
  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  var nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confiemPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AppLoginCubit.get(context).fetchUserData();
    // AppLoginCubit.get(context).firebaseAuthenticate(
    //
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AppUserFetchDataSuccessState) {
          UserRegisterModel userRegisterModel = state.userRegisterModel;
        //   var model =
        //   AppLoginCubit.get(context).auth;
        // //  AppRegisterCubit.get(context).getUserData(registerModel);
        //
        //
        //   // print(registerModel.uId);
        //   // //= UserRegisterModel();
        //   //
        //   // // AppRegisterCubit.get(context).getUserData(registerModel);
          nameController.text = userRegisterModel.name;
          emailController.text = userRegisterModel.email;
          passwordController.text = userRegisterModel.password;
          phoneController.text = userRegisterModel.phone;
          confiemPasswordController.text = userRegisterModel.confirmPassword;
          addressController.text = userRegisterModel.address;
          print(userRegisterModel.name);

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: screenText(
                          text: "Profile",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff4a4b4d)),
                    ),
                  ),
                  Center(
                      child: CircleAvatar(
                          backgroundColor: Colors.black12,
                          radius: 50,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                // Image(image: AssetImage('assets/images/logo.png')),
                                Image.asset(
                                  "assets/images/flag.png",
                                  width: 100,
                                ),
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
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  screenSubText(
                      text: 'Hi there ',
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
                    controller: emailController,
                    //value: registerModel.email,
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
                      hintText: '***********',
                      type: TextInputType.text,
                      controller: passwordController),
                  defaultFormField(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.kPrimaryColor,
                      ),
                      labelText: ('Confirm password'),
                      obscureText: true,
                      hintText: '***********',
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
                ],
              ),
            ),
          );
        } else {
          print('cantttttttttttttttttttt');
        }
        return Container();
      },
    );
  }
}
