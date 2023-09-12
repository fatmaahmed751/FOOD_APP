import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/widgets/custom_app_bar_two.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      child: Scaffold(
          body: Column(
        children: [
          const CustomAppBarTwo(
            title: 'My Order',
          ),
          Container(
            // width: 254,
            height: 100,
            padding: const EdgeInsets.only(left: 21),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/order.png',
                  ),
                  height: 95,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'King Burgers',
                        style:
                            TextStyle(color: Color(0xff4A4B4D), fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                            size: 20,
                          ),
                          Text(
                            '4.9',
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 12),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '(124 ratings)',
                            style: TextStyle(
                                color: Color(0xff4A4B4D), fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Burger',
                            style: TextStyle(
                                color: Color(0xff4A4B4D), fontSize: 12),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '.Westem Food',
                            style: TextStyle(
                                color: Color(0xff4A4B4D), fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add_location_alt_rounded,
                            color: Colors.deepOrange,
                            size: 20,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'No 03, 4th Lane, Newyork',
                            style: TextStyle(
                                color: Color(0xff4A4B4D), fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
         Expanded(
           child: ListView.separated(itemBuilder:(context,index)=>ingredientsOrder(),
           itemCount: 5,
           separatorBuilder: (context,index)=>Container(
             decoration: const BoxDecoration(
               color:  Color(0xffF6F6F6)
             ),
             child: const Divider(
               thickness: 1,
               indent: 20,
               endIndent: 20,
             ),
           ),),
         ),
          Expanded(
          child: ListView.separated(itemBuilder:(context,index)=>costOrder(),
            itemCount: 5,
            separatorBuilder: (context,index)=>const Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),),
          ),
          orangeButton(text: 'Checkout ',function:(){},)
        ],
      ),
      ),
    );
  }
  Widget ingredientsOrder(){
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color(0xffF6F6F6)
      ),
      child: const Row(
        children: [
          Text('Beef Burger x1',
            style: TextStyle(
                color: Color(0xff4A4B4D),
                fontSize: 16
            ),),
          Spacer(),
          Text('10',
            style: TextStyle(
                color: Color(0xff4A4B4D),
                fontSize: 16
            ),)
        ],
      ),
    );
  }

  Widget costOrder(){
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0,
      right: 20),
      child: Container(
        height: 22,
        child: const Row(
          children: [
            Text('Delivery Instrusctions',
              style: TextStyle(
                  color: Color(0xff4A4B4D),
                  fontSize: 16
              ),),
            Spacer(),
            Text('10',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16
              ),)
          ],
        ),
      ),
    );
  }
}
