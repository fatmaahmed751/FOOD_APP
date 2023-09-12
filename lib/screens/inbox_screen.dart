import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(
              title: 'Inbox',
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context,index)=>userInbox(),
                  separatorBuilder:(context,index)=>SizedBox(height: 1,)
                  , itemCount:10 ),
            ),
          ],
        ),
      ),
    );
  }
  Widget userInbox(){
    return Container(
      padding: EdgeInsets.only(left: 20,
          right: 20,
          //top: 20
         ),
      width: 393,
      height:92 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.deepOrange,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                " MealMonkey Promotions",

                style: TextStyle(
                    fontSize: 14, color: Color(0xff4A4B4D)),
              ),
              Spacer(),
              Text(
                '6th july',
                maxLines: 4,
                style: TextStyle(
                    fontSize: 10, color: Color(0xff7C7D7E)),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width:270,
                padding: EdgeInsets.only(left:25),
                // height:82 ,
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 14, color: Color(0xff4A4B4D),
                      height: 1.3
                  ),
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.star_border,
                color: Colors.deepOrange,))
            ],
          ),

        ],
      ),
    );
  }
}