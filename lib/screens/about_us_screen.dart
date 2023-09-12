
import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(
              title: 'About US',
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context,index)=>aboutUs(),
                  separatorBuilder:(context,index)=>SizedBox(height: 10,)
                  , itemCount:3 ),
            ),
          ],
        ),
      ),
    );
  }
  Widget aboutUs(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const CircleAvatar(
            radius: 4,
            backgroundColor: Colors.deepOrange,
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 316,
            //height: 200,
            child: const Text(
              'Lorem ipsum dolor sit amet,'
                  ' consectetur adipiscing elit,'
                  ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,'
                  ' quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                  ' Excepteur sint occaecat cupidatat non proident,'
                  ' sunt in culpa qui officia deserunt mollit anim id est laborum.'
                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                  'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                  ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
              maxLines: 9,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                height: 1.5,
                  fontSize: 14, color: Color(0xff4A4B4D)),
            ),
          ),
        ],
      ),
    );
  }
}