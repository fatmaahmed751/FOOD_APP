import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/login_screen.dart';
import 'package:restaurant_app/screens/register_screen.dart';
import 'package:restaurant_app/screens/splash_screen.dart';
import 'package:restaurant_app/shared/components/components.dart';



class FirstPage extends StatefulWidget {

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      //backgroundColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            defaultContainer(),
            const SizedBox(height: 15,),
            mainText(),
            secondText(),
            const SizedBox(height: 3,),
            Center(
              child: orangeButton(
                text: 'Login',
                function:(){
                  Navigator.push(context, MaterialPageRoute(builder:(_)=> LoginScreen()));
                 //Navigator.push(context, AppRouts.loginScreen as Route<Object?>);
                  //Navigator.pushReplacementNamed(context,AppRouts.loginScreen);
                },
              ),
            ),
            Center(
              child: defaultButton(
                text: 'Create An account',
                textColor: Colors.deepOrangeAccent,
                color: Colors.transparent,
                function: (){
                  Navigator.push(context, MaterialPageRoute(builder:(_)=> SignUpScreen()));
                }
            ),
            ),
            defaultDivider(),
          ],
        ),
      ),
    );
  }
}



