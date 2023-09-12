
import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            screenText(
                text:"Reset Password",
                fontSize: 30,
                fontWeight:FontWeight.w400,
                color: Color(0xff4a4b4d)
            ),
            SizedBox(height: 5,),
            Align(
              alignment: Alignment.center,
              child: screenSubText(
                  text: "Please enter your email to receive a link to create anew password via email ",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7c7d7e),


              ),
            ),
            defaultFormField(
              obscureText: false,
               prefixIcon:Icon(Icons.email_outlined,
                  color: AppColors.kPrimaryColor,),
                labelText: ('Your Email'),

                type:TextInputType.text,
                controller:emailController,
                hintText: 'Your email'),
            SizedBox(height: 10,),
            Center(
              child: orangeButton(
                  text: 'Login',
                function:(){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
