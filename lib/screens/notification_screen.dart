import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(
              title: 'Notifications',
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context,index)=>notificationForUser(),
              separatorBuilder:(context,index)=>Divider(thickness: 1.0,
              indent: 20,
              endIndent: 20,)
              , itemCount:10 ),
            ),
          ],
        ),
      ),
    );
  }
  Widget notificationForUser(){
  return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const CircleAvatar(
            radius: 5,
            backgroundColor: Colors.deepOrange,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 289,
                height: 12,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                      ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: 14, color: Color(0xff4A4B4D)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'None',
                style: TextStyle(
                    fontSize: 14, color: Color(0xffb6b7b7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
