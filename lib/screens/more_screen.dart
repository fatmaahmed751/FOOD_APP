import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/screens/about_us_screen.dart';
import 'package:restaurant_app/screens/inbox_screen.dart';
import 'package:restaurant_app/screens/my_order_screen.dart';
import 'package:restaurant_app/screens/notification_screen.dart';
import 'package:restaurant_app/screens/payment_screen.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';

import 'item_details.dart';


class MoreScreen extends StatelessWidget {

   final String image;
   final String recipeName ;
   final String rate ;
   final double prices ;
   final String categoryName ;
   final String type ;
   final double price;
   const MoreScreen({super.key,
     this.image='',
     this.recipeName ='' ,
     this.rate = '',
     this.prices =0.0,
     this.categoryName ='',
     this.type='',  this.price=0.0,
   });

  @override
  Widget build(BuildContext context) {

   ItemDetails itemDetails = ItemDetails(prices:prices , image:image, rate: rate, recipeName: recipeName,
     categoryName:categoryName,type: type);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'More',
          ),
          const SizedBox(height: 20,),
          moreScreenContainer(image: 'assets/images/income.png', text: 'Payment Details',
          function:(){
            Navigator.push(context,MaterialPageRoute(builder:(context)=> const PaymentScreen()));}
          ),
          const SizedBox(height: 30,),
          moreScreenContainer(image: 'assets/images/shopping-bag.png', text: 'My Orders',
              function: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>
                    MyOrderScreen(
                  image: itemDetails.image,
                  rate:   itemDetails.rate,
                  recipeName:itemDetails.recipeName,
                  prices: itemDetails.prices,
                    categoryName:itemDetails.categoryName,
                  type: itemDetails.type,

                )));
              }),
          const SizedBox(height: 30,),
          moreScreenContainer(image: 'assets/images/bell.png', text: 'Notifications',
              function: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> const NotificationScreen()));
              }),
          const SizedBox(height: 30,),
          moreScreenContainer(image: 'assets/images/mail.png', text: 'Inbox',
              function: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> const InboxScreen()));
              }),
          const SizedBox(height: 30,),
          moreScreenContainer(image: 'assets/images/info.png', text: 'About Us',
              function: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> const AboutUsScreen()));
              }),
        ],
      ),
    );
  }
}
