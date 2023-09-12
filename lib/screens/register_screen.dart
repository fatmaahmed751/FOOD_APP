import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/controllers/login_bloc/login_cubit.dart';
import 'package:restaurant_app/controllers/login_bloc/login_state.dart';
import 'package:restaurant_app/controllers/register_cubit/register_cubit.dart';
import 'package:restaurant_app/controllers/register_cubit/register_state.dart';
import 'package:restaurant_app/models/register_model.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/models/user_login_model.dart';
import 'package:restaurant_app/screens/layout_screen.dart';
import 'package:restaurant_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
   const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState>  formKey=GlobalKey();

  FirebaseAuth auth = FirebaseAuth.instance;

 UserRegisterModel? registerModel;

    TextEditingController nameController=TextEditingController();

    TextEditingController emailController=TextEditingController();

    TextEditingController phoneController=TextEditingController();

    TextEditingController addressController=TextEditingController();

    TextEditingController passwordController=TextEditingController();

    TextEditingController confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create:(context)=>AppRegisterCubit(),
        child: BlocConsumer<AppRegisterCubit,RegisterStates>(
            listener: (context,state){},
            builder: (context,state) {
              AppRegisterCubit cubit = AppRegisterCubit.get(context);
              return SafeArea(
                top: false,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        // من خلال ال كى اقدر اكسسز البياانات اللي جوه الفورم اقدر اعرف هي سليمه ولا مش سليمه
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30,),
                            screenText(
                                text:"Sign UP",
                                fontSize: 30,
                                fontWeight:FontWeight.w400,
                                color: Color(0xff4a4b4d)
                            ),
                            SizedBox(height: 10,),
                            screenSubText(
                                text: "add your details to sign up ",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54
                            ),

                            defaultFormField(

                                prefixIcon:  Icon(Icons.person,
                                  color: AppColors.kPrimaryColor,),
                                labelText: ('Name'),

                                type:TextInputType.text,
                                controller:nameController,
                                hintText: 'Name',
                                validator: (data){
                                  data = nameController.text;
                                  if(data.isEmpty){
                                    return "value is wrong";
                                  }
                                  return null;
                                }
                            ),

                            defaultFormField(

                                prefixIcon:  Icon(Icons.email_outlined,
                                  color: AppColors.kPrimaryColor,),
                                labelText: ('Email'),

                                type:TextInputType.text,
                                controller:emailController,
                                hintText: 'Email',
                                // onChanged: (data){
                                //   emailController.text = data;
                                // }
                               ),

                            defaultFormField(

                                prefixIcon:  Icon(Icons.phone_android_outlined,
                                  color: AppColors.kPrimaryColor,),
                                labelText: ('Mobile'),

                                type:TextInputType.text,
                                controller:phoneController,
                                hintText: 'Mobile No'),

                            defaultFormField(

                                prefixIcon:  Icon(Icons.home_outlined,
                                  color: AppColors.kPrimaryColor,),
                                labelText: ('Address'),

                                type:TextInputType.text,
                                controller:addressController,
                                hintText: 'Address'),

                            defaultFormField(
                                obscureText: true,
                                prefixIcon:  Icon(Icons.lock_outline_rounded,
                                  color: AppColors.kPrimaryColor,),
                                labelText: ('Password'),
                                suffixIcon:Icon(Icons.visibility_off_outlined,
                                  color: AppColors.kPrimaryColor,),
                                type:TextInputType.text,
                                controller:passwordController,
                                hintText: 'Password',

                                ),

                            defaultFormField(
                              obscureText: true,
                              prefixIcon:  Icon(Icons.lock_outline_rounded,
                                color: AppColors.kPrimaryColor,),
                              suffixIcon:Icon(Icons.visibility_off_outlined,
                                color: AppColors.kPrimaryColor,),
                              labelText: ('Confirm password'),

                              type:TextInputType.text,
                              controller:confirmPasswordController,
                              hintText: 'Confirm Password',
                            ),

                            Center(
                              child: orangeButton(
                                  text: 'Sign Up', function:()async {
                                if (formKey.currentState!.validate()) {
                                  registerModel=UserRegisterModel(
                                    email:emailController.text,
                                    password: passwordController.text
                                  );
                                  cubit.firebaseAuthenticate(registerModel!);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LayoutScreen()));
                                }else{
                                  print('not valide');
                                }

                              }
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                screenSubText(
                                    text: "Already have an Account?",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54
                                ),
                                funText(
                                  text: "Login",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  function: (){
                                    Navigator.pop(context,MaterialPageRoute(builder:(context)=> LoginScreen()));
                                  },
                                ),


                              ],
                            ),
                            SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ));
  }
}

