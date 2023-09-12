import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/controllers/login_bloc/login_cubit.dart';
import 'package:restaurant_app/controllers/login_bloc/login_state.dart';
import 'package:restaurant_app/models/user_login_model.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserLoginModel? model;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppLoginCubit cubit = AppLoginCubit.get(context);

            return Scaffold(
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Spacer(),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: screenText(
                              text: "Login",
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff4a4b4d)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        screenSubText(
                            text: "add your details to login ",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                        defaultFormField(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.kPrimaryColor,
                          ),
                          labelText: ('Email'),
                          type: TextInputType.text,
                          controller: emailController,
                          hintText: 'Your email',
                          // onChanged: (data) {
                          //   emailController.text = data;
                          // },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),
                        defaultFormField(
                          obscureText: true,
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.kPrimaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.kPrimaryColor,
                          ),
                          labelText: ('Password'),
                          type: TextInputType.text,
                          controller: passwordController,
                          hintText: 'Password',
                          onChanged: (data) {
                            // passwordController.text = data;
                          },
                          validator: (value) {
                            // passwordController.text = value!;
                            if (value!.length < 6) {
                              return "password is too short";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: orangeButton(
                            text: 'Login',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                model=UserLoginModel(email:emailController.text
                                    , password: passwordController.text);
                                cubit.firebaseAuthenticate(context,model!);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const LayoutScreen()));

                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        screenSubText(
                            text: "Forgot your password",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                        const SizedBox(
                          height: 20,
                        ),
                        screenSubText(
                            text: "Or Login With",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),

                        const SizedBox(
                          height: 25,
                        ),
                        defaultButton(
                            text: 'f      login with Facebook',
                            color: Colors.blue[800]!,
                            function: () {},
                            textColor: Colors.white),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultButton(
                            text: 'G+      login with Google',
                            color: Colors.redAccent,
                            function: () {},
                            textColor: Colors.white),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            screenSubText(
                              text: "Don\'t have an account?",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(124, 125, 126, 101),
                            ),
                            funText(
                                text: "Sign up",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // defaultDivider(),
                      ],
                    ),
                  ),

              ),
              )
            );
          }),
    );
  }
}
