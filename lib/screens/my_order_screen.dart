import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/widgets/custom_app_bar_two.dart';

import '../controllers/app_bloc/cubit.dart';
import '../controllers/app_bloc/states.dart';
import '../models/recent_items_model.dart';
import '../shared/components/app_colors.dart';
import 'check_out_screen.dart';
import 'item_details.dart';

class MyOrderScreen extends StatelessWidget {
 final String image;
  final String recipeName;
  final String rate;
  final double prices;
  final String categoryName;
  final String type;
   final double price ;
   const MyOrderScreen({super.key,
    this.image='',
     this.recipeName ='',
     this.rate ='',
  this.prices =0.0,
     this.categoryName ='',
       this.type='',
     this.price =0,
  });

  @override
  Widget build(BuildContext context) {
    int quantity=1;
   // int price = 0;

    int calculatePrice(int numberOfPieces, double pricePerPiece) {
      return (numberOfPieces + pricePerPiece).toInt();
    }
    ItemDetails itemDetails =
    ItemDetails(
      prices:prices ,
      image: image,
      rate: rate,
      recipeName: recipeName,
        categoryName:categoryName,
      type: type,
    );

          return BlocBuilder<AppCubit,AppStates>(
              builder: (context, state) {
                AppCubit cubit = AppCubit.get(context);
                var recentItems = AppCubit.get(context).recentModel;
               // ingredients = recentItems.data.ing;
                return SafeArea(
                top: false,
                minimum: EdgeInsets.zero,
                child: Scaffold(
                  body: Column(
                    children: [
                      const SizedBox(height: 30,),
                      const CustomAppBarTwo(
                        title: 'My Order',
                      ),
                      Container(
                        // width: 254,
                        height: 120,
                        padding: const EdgeInsets.only(left: 21),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Card(
                              clipBehavior:Clip.antiAliasWithSaveLayer,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),

                                ),
                                width: 90,
                                child: Image.network(
                                  //"https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",

                                  itemDetails.image,
                                  fit: BoxFit.cover,
                                  height: 95,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemDetails.recipeName,
                                    style:
                                    const TextStyle(
                                        color: Color(0xff4A4B4D), fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.deepOrange,
                                        size: 20,
                                      ),
                                      Text(
                                        itemDetails.rate,
                                        style: const TextStyle(
                                            color: Colors.deepOrange, fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Text(
                                        '(124 ratings)',
                                        style: TextStyle(
                                            color: Color(0xff4A4B4D), fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        itemDetails.type,
                                        style: const TextStyle(
                                            color: Color(0xff4A4B4D), fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        width: 3,
                                        height: 3,
                                        decoration: BoxDecoration(
                                            color: AppColors.kPrimaryColor,
                                            borderRadius: BorderRadius.circular(
                                                20)),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        itemDetails.categoryName,
                                        style: const TextStyle(
                                            color: Color(0xff4A4B4D), fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
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
                                        //'',
                                        // " ${cubit.currentPosition}",
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
                      //const SizedBox(height: 10,),
                      Container(
                        //color: Colors.black,
                        height: 280,
                        child: ListView.separated(
                          itemBuilder: (context, index) => ingredientsOrder(recentItems[index],context),
                          itemCount: recentItems.length,
                          separatorBuilder: (context, index) =>
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffF6F6F6)
                                ),
                                child: const Divider(
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ),),
                      ),
                      const SizedBox(height: 30),

                      costOrder(),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,
                            right: 20),
                        child: Container(
                          height: 22,
                          child:  Row(
                            children: [
                              const Text('Sub Total',
                                style: TextStyle(
                                    color: Color(0xff4A4B4D),
                                    fontSize: 16
                                ),),
                              const Spacer(),
                              Text('\$${price.toInt() }',
                                //calculatePrice((quantity), itemDetails.prices)}',
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 14
                                ),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,
                            right: 20),
                        child: Container(
                          height: 22,
                          child:  const Row(
                            children: [
                              Text('Delivery Cost',
                                style: TextStyle(
                                    color: Color(0xff4A4B4D),
                                    fontSize: 16
                                ),),
                              Spacer(),
                              Text('\$10',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 14
                                ),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,
                            right: 20),
                        child: Container(
                          height: 22,
                          child:  Row(
                            children: [
                              const Text('Total',
                                style: TextStyle(
                                    color: Color(0xff4A4B4D),
                                    fontSize: 16
                                ),),
                              const Spacer(),
                              Text('\$'
                                  '${calculatePrice((10),price.toDouble())}',
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      orangeButton(text: 'Checkout ', function: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> CheckOut(
                          iPrice: itemDetails.prices,

                         // itemDetails.prices,
                         // MyOrderScreen.price,
                          //calculatePrice((10),price).toDouble()
                         // price.toInt().toDouble()
                         // calculatePrice((10),price).toDouble()
                          // calculatePrice((quantity),price).toDouble(),
                        )));
                      },)
                    ],
                  ),
                ),
              );
            }
          );


  }

  Widget ingredientsOrder(recentItems, context){
      return Expanded(
        child: Container(
height:260,
          padding: const EdgeInsets.only(left:20,right:20),
          decoration: const BoxDecoration(
              color: Color(0xffF6F6F6)
          ),
          child:  Column(
            children: [
              Container(
                height: 45,
                child: Row(
                  children: [
                    Text(
                      '${recentItems.ing[0]} x1',
                      style: const TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),
                    ),
                    const Spacer(),
                    const Text('10',
                      style: TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),)
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF6F6F6)
                ),
                child: const Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Container(
                height: 45,
                child: Row(
                  children: [
                    Text(
                      '${recentItems.ing[1] } x1',
                      style: const TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),
                    ),
                    const Spacer(),
                    const Text('10',
                      style: TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),)
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF6F6F6)
                ),
                child: const Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Container(
                height: 45,
                child: Row(
                  children: [
                    Text(
                      '${recentItems.ing[2]} x1',
                      style: const TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),
                    ),
                    const Spacer(),
                    const Text('10',
                      style: TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),)
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffF6F6F6)
                ),
                child: const Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Container(
                height: 45,
                child: Row(
                  children: [
                    Text(
                      '${recentItems.ing[3]} x1',
                      style: const TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),
                    ),
                    const Spacer(),
                    const Text('10',
                      style: TextStyle(
                          color: Color(0xff4A4B4D),
                          fontSize: 16
                      ),)
                  ],
                ),
              ),

            ],
          ),
        ),
      );
      Container(

        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            color: Color(0xffF6F6F6)
        ),
        child:  Row(
          children: [
            Text(
              '${recentItems.ing[0]}',
              style: const TextStyle(
                  color: Color(0xff4A4B4D),
                  fontSize: 16
              ),
            ),
            const Spacer(),
            const Text('10',
              style: TextStyle(
                  color: Color(0xff4A4B4D),
                  fontSize: 16
              ),)
          ],
        ),
      );
    //  print(recentItems.ing[x]);
    }
  // return Container();
 // }

  Widget costOrder(){
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0,
      right: 20),
      child: Container(
        height: 25,
        child: const Row(
          children: [
            Text('Delivery Instructions',
              style: TextStyle(
                  color: Color(0xff4A4B4D),
                  fontSize: 16
              ),),
            Spacer(),
            Text('+ Add Notes',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 14
              ),)
          ],
        ),
      ),
    );
  }



}
