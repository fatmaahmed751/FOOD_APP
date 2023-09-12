import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/components/components.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              screenText(
                fontSize: 25,
                  text:"We have sent an OTP to",
                  fontWeight:FontWeight.w400,
                  color: Color(0xff4a4b4d)
              ),
              Center(
                child: screenText(
                  text:"your Mobile",
                  fontSize: 27,
                  fontWeight:FontWeight.w400,
                    color: Color(0xff4a4b4d)
                ),
              ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.center,
                child: screenSubText(
                  text: "Please check your mobile number 017*****12 continue to reset password ",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7c7d7e),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width:20 ,),
                  secureText(),
                  SizedBox(width:30 ,),
                  secureText(),
                  SizedBox(width:30 ,),
                  secureText(),
                  SizedBox(width:30 ,),
                  secureText(),
                ],
              ),
              orangeButton(text: 'Next', function:(){},),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  screenSubText(
                    text: "Didn\'t Receive?",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(124, 125, 126,101),
                  ),
                  funText(
                    text: "Click Here",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    function: (){
                      //Navigator.pop(context,MaterialPageRoute(builder:(context)=>const LoginScreen()));
                    },
                  ),
                ],
              ),
              defaultDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
