import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';

import '../controllers/app_bloc/states.dart';
import '../widgets/custom_app_bar_two.dart';
import '../widgets/custom_text.dart';


class ItemDetails extends StatefulWidget{
  const ItemDetails({super.key,required this.image, required this.recipeName, required this.rate});
  final String image;
  final String recipeName;
  final String rate;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  //final String image;
  @override
  Widget build(BuildContext context) {
    double prices=750;
    double price=0;


      return SafeArea(
        top: false,
        child: Scaffold(
          body: CustomScrollView(
              slivers: [
                SliverAppBar(

                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      widget.image,
                      //"https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",

                      width: double.maxFinite,
                      fit: BoxFit.cover,),
                  ),
                  expandedHeight: 280,
                ),

                SliverToBoxAdapter(
                  child: Container(
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50
                            ))
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                         CustomText(
                          text:widget.recipeName
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: AppColors.kPrimaryColor,
                            ),
                            CustomText(
                              text: '${widget.rate} Star Ratings',
                              color: AppColors.kPrimaryColor,
                              size: AppFontSize.s16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Spacer(),
                             Column(
                              children: [
                                CustomText(
                                  text: 'Rs.$prices',
                                  fontWeight: FontWeight.bold,
                                  size: 25,
                                ),
                                const CustomText(
                                  text: '/per Portion',
                                  fontWeight: FontWeight.normal,
                                  size: 12,
                                ),
                              ],
                            )
                          ],
                        ),
                        CustomText(
                          text: 'Description',
                          color: AppColors.blackColor,
                          size: AppFontSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 316,
                          //height: 200,
                          child: Text(
                            'Lorem ipsum dolor sit amet,  consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada',
                            style: TextStyle(
                              //  overflow: TextOverflow.ellipsis,
                                height: 1.2,
                                fontSize: 14,
                                color: AppColors.lightGrey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                          text: 'Customize your Order',
                          color: AppColors.blackColor,
                          size: AppFontSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 333.h,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0

                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Row(
                              children: [
                                CustomText(
                                    text: '- Select the size of portion -',
                                    size: AppFontSize.s14),
                                Spacer(),

                              ],
                            ),

                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 333.h,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(5.0

                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Row(
                              children: [
                                CustomText(
                                    text: '- Select the ingredients -',
                                    size: AppFontSize.s14),
                                Spacer(),


                              ],
                            ),

                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 333.h,
                          height: 45,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Row(
                                children: [
                                  const CustomText(text: 'Number of Portion',
                                      size: AppFontSize.s14),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: (){
                                      price = prices/2;
                                      print(price);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 1,
                                              color: AppColors.lightGrey
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Text('-',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 18),),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      //  color: AppColors.kPrimaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: AppColors.kPrimaryColor,),

                                    ),
                                    child: Center(
                                      child: Text('1',
                                        style: TextStyle(
                                            color: AppColors.kPrimaryColor,
                                            fontSize: 15),),
                                    ),
                                  ),
                                  const SizedBox(width: 2),

                                  GestureDetector(
                                    onTap: (){
                                      prices*=2;
                                      price =prices;
                                      print(price);

                                    },
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: AppColors.kPrimaryColor,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 1,
                                                color: AppColors.lightGrey
                                            )
                                          ]
                                      ),
                                      child: Center(
                                        child: Text('+',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 15),),
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                width: 90.w,
                                height: 150.h,
                                decoration: BoxDecoration(
                                    color: AppColors.kPrimaryColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Container(
                                  height: 122.h,
                                  width: 260.w,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(10)),
                                      color: Colors.white

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 13.0, bottom: 13),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        const CustomText(text: 'Total Price',
                                          fontWeight: FontWeight.w400,
                                          size: 14,),
                                           TextButton(
                                             child: Text('$price'),
                                             onPressed: (){
                                               setState(() {
                                                 prices*=2;
                                                 price =prices;
                                                 print(price);
                                                 price;
                                               });
                                             },
                                           ),
                                        // CustomText(text: '$price',
                                        //   fontWeight: FontWeight.bold,
                                        //   size: 18,),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0, left: 18),
                                          child: Container(
                                            //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                            // padding: const EdgeInsets.only(right: 200.0),
                                            width: 175,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppColors.kPrimaryColor,
                                              borderRadius: BorderRadius
                                                  .circular(100.0),
                                            ),

                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.shopping_cart,
                                                      size: 22,
                                                      color: AppColors
                                                          .whiteColor,
                                                    )),
                                                const Text(
                                                  'Add To Cart',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                ),

                              ),
                            ),
                          ],

                        ),

                      ],
                    ),
                  ),
                ),
              ]
          ),
//             Container(
//               color: Colors.yellow,
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Positioned(
//                     top: -24,
// // color: Colors.yellow,
//                     width: 380.w,
//                     height: 300,
//                     child: Image.network(
//                       'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
// // fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 25.h, bottom: 10.h, right: 20.w),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: Icon(
//                               Icons.arrow_back_ios,
//                               size: 20,
//                               color: AppColors.whiteColor,
//                             )),
//                         const Spacer(),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.shopping_cart,
//                               size: 22,
//                               color: AppColors.whiteColor,
//                             ))
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 220,
//                     // left: 20,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 700,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(42),
//                             topRight: Radius.circular(40)),
//                         boxShadow: const [
//                           BoxShadow(
//                               offset: Offset(2, 1),
//                               color: Colors.grey,
//                               spreadRadius: 1,
//                               blurRadius: 1),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             const CustomText(
//                               text: 'Tandoori Chicken Pizza',
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: AppColors.kPrimaryColor,
//                                 ),
//                                 CustomText(
//                                   text: '4 Star Ratings',
//                                   color: AppColors.kPrimaryColor,
//                                   size: AppFontSize.s16,
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 const Spacer(),
//                                 const Column(
//                                   children: [
//                                     CustomText(
//                                       text: 'Rs.750',
//                                       fontWeight: FontWeight.bold,
//                                       size: 25,
//                                     ),
//                                     CustomText(
//                                       text: '/per Portion',
//                                       fontWeight: FontWeight.normal,
//                                       size: 12,
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                             CustomText(
//                               text: 'Description',
//                               color: AppColors.blackColor,
//                               size: AppFontSize.s16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             const SizedBox(height: 10),
//                             Container(
//                               width: 316,
//                               //height: 200,
//                               child: Text(
//                                 'Lorem ipsum dolor sit amet,  consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada',
//                                 style: TextStyle(
//                                   //  overflow: TextOverflow.ellipsis,
//                                     height: 1.2,
//                                     fontSize: 14,
//                                     color: AppColors.lightGrey),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             CustomText(
//                               text: 'Customize your Order',
//                               color: AppColors.blackColor,
//                               size: AppFontSize.s16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             const SizedBox(height: 10),
//                             Container(
//                               width: 333.h,
//                               height: 45,
//                               decoration: BoxDecoration(
//                                 color: AppColors.lightGrey.withOpacity(.2),
//                                 borderRadius: BorderRadius.circular(5.0
//
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 3.0),
//                                 child:  Row(
//                                   children: [
//                                     const CustomText(text:'- Select the size of portion -',
//                                         size: AppFontSize.s14),
//                                     const Spacer(),
//                                     DropdownButton(
//                                       value: dropdownvalue,
//                                       icon: const Icon(Icons.keyboard_arrow_down),
//                                       items: items.map((String items) {
//                                         return DropdownMenuItem(
//                                           value: items,
//                                           child: Text(items),
//                                         );
//                                       }).toList(),
//
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           dropdownvalue = newValue!;
//                                         });
//                                       },
//                                     ),
//
//
//                                     // DropdownButton(
//                                     //   value: startValue,
//                                     //     items: const [
//                                     //       DropdownMenuItem<int>(
//                                     //         value:1,
//                                     //         child:Text('1',)
//                                     //       ),
//                                     //       DropdownMenuItem<int>(
//                                     //           value:2,
//                                     //           child:Text('2',)
//                                     //       ),
//                                     //     ],
//                                     //   onChanged: ( newValue){
//                                     //     if(newValue is int) {
//                                     //       setState(() {
//                                     //         startValue = newValue;
//                                     //       });
//                                     //     }
//                                     //   },
//                                     //   icon: const Icon(Icons.keyboard_arrow_down_sharp)
//                                     //   ,),
//
//
//                                     //   DropdownMenuItem(
//                                     //       child:Text('1'),
//                                     //     value: 1,
//                                     //   ),
//                                     //   DropdownMenuItem(
//                                     //     child:Text('2'),
//                                     //     value: 2,
//                                     //   ),
//                                     // ].map((e) => ),
//                                     // DropdownMenu<int?>(
//                                     //     initialSelection: numbers.first,
//                                     //     onSelected: (int? value) {
//                                     //       // This is called when the user selects an item.
//                                     //       setState(() {
//                                     //         startValue = value ??0;
//                                     //       });
//                                     //     },
//                                     //     dropdownMenuEntries :numbers.map<DropdownMenuEntry<int>>((int? value) {
//                                     //      return DropdownMenuEntry<int>(
//                                     //       value: value!,label:value.toString() );
//                                     //
//                                     //      }).toList(),
//                                     //
//                                     // ),
//                                     //value: startValue,
//                                     //   items: numbers.map((number) => DropdownMenuItem<int?>(
//                                     //     value: number,
//                                     //     child: Text(number?.toString() ?? ''),
//                                     //   )).toList(),
//                                     //   onChanged: (newNumber) {
//                                     //     setState(() {
//                                     //       print('ggggggggggggg');
//                                     //       startValue = newNumber!;
//                                     //       print('ggggggggggggg');
//                                     //     });
//                                     //   },
//                                     // ),
//                                   ],
//                                 ),
//
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Container(
//                               width: 333.h,
//                               height: 45,
//                               decoration: BoxDecoration(
//                                 color: AppColors.lightGrey.withOpacity(.2),
//                                 borderRadius: BorderRadius.circular(5.0
//
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 3.0),
//                                 child:  Row(
//                                   children: [
//                                     const CustomText(text:'- Select the ingredients -',
//                                         size: AppFontSize.s14),
//                                     const Spacer(),
//                                     DropdownButton(
//                                       value: dropdownvalue,
//                                       icon: const Icon(Icons.keyboard_arrow_down),
//                                       items: items.map((String items) {
//                                         return DropdownMenuItem(
//                                           value: items,
//                                           child: Text(items),
//                                         );
//                                       }).toList(),
//
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           dropdownvalue = newValue!;
//                                         });
//                                       },
//                                     ),
//
//
//                                     // DropdownButton(
//                                     //   value: startValue,
//                                     //     items: const [
//                                     //       DropdownMenuItem<int>(
//                                     //         value:1,
//                                     //         child:Text('1',)
//                                     //       ),
//                                     //       DropdownMenuItem<int>(
//                                     //           value:2,
//                                     //           child:Text('2',)
//                                     //       ),
//                                     //     ],
//                                     //   onChanged: ( newValue){
//                                     //     if(newValue is int) {
//                                     //       setState(() {
//                                     //         startValue = newValue;
//                                     //       });
//                                     //     }
//                                     //   },
//                                     //   icon: const Icon(Icons.keyboard_arrow_down_sharp)
//                                     //   ,),
//
//
//                                     //   DropdownMenuItem(
//                                     //       child:Text('1'),
//                                     //     value: 1,
//                                     //   ),
//                                     //   DropdownMenuItem(
//                                     //     child:Text('2'),
//                                     //     value: 2,
//                                     //   ),
//                                     // ].map((e) => ),
//                                     // DropdownMenu<int?>(
//                                     //     initialSelection: numbers.first,
//                                     //     onSelected: (int? value) {
//                                     //       // This is called when the user selects an item.
//                                     //       setState(() {
//                                     //         startValue = value ??0;
//                                     //       });
//                                     //     },
//                                     //     dropdownMenuEntries :numbers.map<DropdownMenuEntry<int>>((int? value) {
//                                     //      return DropdownMenuEntry<int>(
//                                     //       value: value!,label:value.toString() );
//                                     //
//                                     //      }).toList(),
//                                     //
//                                     // ),
//                                     //value: startValue,
//                                     //   items: numbers.map((number) => DropdownMenuItem<int?>(
//                                     //     value: number,
//                                     //     child: Text(number?.toString() ?? ''),
//                                     //   )).toList(),
//                                     //   onChanged: (newNumber) {
//                                     //     setState(() {
//                                     //       print('ggggggggggggg');
//                                     //       startValue = newNumber!;
//                                     //       print('ggggggggggggg');
//                                     //     });
//                                     //   },
//                                     // ),
//                                   ],
//                                 ),
//
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Container(
//                               width: 333.h,
//                               height: 45,
//
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 3.0),
//                                 child:  Row(
//                                     children: [
//                                       const CustomText(text:'Number of Portion',
//                                           size: AppFontSize.s14),
//                                       const Spacer(),
//                                       Container(
//                                         width: 50,
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           color: AppColors.kPrimaryColor,
//                                           borderRadius: BorderRadius.circular(15),
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 blurRadius: 1,
//                                                 color: AppColors.lightGrey
//                                             )
//                                           ],
//                                         ),
//                                         child: Center(
//                                           child: Text('-',
//                                             style: TextStyle(color: AppColors.whiteColor,
//                                                 fontSize: 18),),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 2),
//                                       Container(
//                                         width: 50,
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                           //  color: AppColors.kPrimaryColor,
//                                           borderRadius: BorderRadius.circular(15),
//                                           border: Border.all(color:AppColors.kPrimaryColor,),
//
//                                         ),
//                                         child: Center(
//                                           child: Text('1',
//                                             style: TextStyle(color: AppColors.kPrimaryColor,
//                                                 fontSize: 15),),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 2),
//
//                                       Container(
//                                         width: 50,
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                             color: AppColors.kPrimaryColor,
//                                             borderRadius: BorderRadius.circular(15),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   blurRadius: 1,
//                                                   color: AppColors.lightGrey
//                                               )
//                                             ]
//                                         ),
//                                         child: Center(
//                                           child: Text('+',
//                                             style: TextStyle(color: AppColors.whiteColor,
//                                                 fontSize: 15),),
//                                         ),
//                                       ),
//                                     ]
//                                 ),
//                               ),
//                             ),
//                             Stack(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Container(
//                                     width: 90.w,
//                                     height: 150.h,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.kPrimaryColor,
//                                         borderRadius: BorderRadius.only(
//                                             topRight: Radius.circular(40),
//                                             bottomRight: Radius.circular(40))),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top:20.0),
//                                   child: Center(
//                                     child: Container(
//                                       height: 122.h,
//                                       width: 260.w,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(topRight:Radius.circular(10),
//                                               topLeft:Radius.circular(40) ,
//                                               bottomLeft:Radius.circular(40) ,
//                                               bottomRight:Radius.circular(10) ),
//                                           color: Colors.white
//
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top:13.0,bottom: 13),
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             CustomText(text: 'Total Price',
//                                               fontWeight: FontWeight.w400,
//                                               size: 14,),
//                                             CustomText(text: 'LKR 1500',
//                                               fontWeight: FontWeight.bold,
//                                               size: 18,),
//                                             Padding(
//                                               padding: const EdgeInsets.only(right: 20.0, left: 18),
//                                               child: Container(
//                                                 //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                                                 // padding: const EdgeInsets.only(right: 200.0),
//                                                 width: 175,
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                   color: AppColors.kPrimaryColor,
//                                                   borderRadius: BorderRadius.circular(100.0),
//                                                 ),
//
//                                                 child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.center,
//                                                   children: [
//                                                     IconButton(
//                                                         onPressed: () {},
//                                                         icon:  Icon(
//                                                           Icons.shopping_cart,
//                                                           size: 22,
//                                                           color: AppColors.whiteColor,
//                                                         )),
//                                                     Text(
//                                                       'Add To Cart',
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 15,
//                                                           fontWeight: FontWeight.w400),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//
//                               ],
//                             ),
//
//                           ],
//
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//           children:[ Container(
//             color: Colors.yellow,
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.topCenter,
//               children: [
//                 Positioned(
//                   top: -24,
// // color: Colors.yellow,
//                   width: 380.w,
//                   height: 300,
//                   child: Image.network(
//                     'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
// // fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 25.h, bottom: 10.h, right: 20.w),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Icons.arrow_back_ios,
//                             size: 20,
//                             color: AppColors.whiteColor,
//                           )),
//                       const Spacer(),
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.shopping_cart,
//                             size: 22,
//                             color: AppColors.whiteColor,
//                           ))
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 220,
//                   // left: 20,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 700,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(42),
//                           topRight: Radius.circular(40)),
//                       boxShadow: const [
//                         BoxShadow(
//                             offset: Offset(2, 1),
//                             color: Colors.grey,
//                             spreadRadius: 1,
//                             blurRadius: 1),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const CustomText(
//                             text: 'Tandoori Chicken Pizza',
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 size: 16,
//                                 color: AppColors.kPrimaryColor,
//                               ),
//                               CustomText(
//                                 text: '4 Star Ratings',
//                                 color: AppColors.kPrimaryColor,
//                                 size: AppFontSize.s16,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               const Spacer(),
//                               const Column(
//                                 children: [
//                                   CustomText(
//                                     text: 'Rs.750',
//                                     fontWeight: FontWeight.bold,
//                                     size: 25,
//                                   ),
//                                   CustomText(
//                                     text: '/per Portion',
//                                     fontWeight: FontWeight.normal,
//                                     size: 12,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           CustomText(
//                             text: 'Description',
//                             color: AppColors.blackColor,
//                             size: AppFontSize.s16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             width: 316,
//                             //height: 200,
//                             child: Text(
//                               'Lorem ipsum dolor sit amet,  consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada',
//                               style: TextStyle(
//                                   //  overflow: TextOverflow.ellipsis,
//                                   height: 1.2,
//                                   fontSize: 14,
//                                   color: AppColors.lightGrey),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           CustomText(
//                             text: 'Customize your Order',
//                             color: AppColors.blackColor,
//                             size: AppFontSize.s16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             width: 333.h,
//                             height: 45,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightGrey.withOpacity(.2),
//                               borderRadius: BorderRadius.circular(5.0
//
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 3.0),
//                               child:  Row(
//                                 children: [
//                                   const CustomText(text:'- Select the size of portion -',
//                                   size: AppFontSize.s14),
//                                   const Spacer(),
//                                   DropdownButton(
//                                     value: dropdownvalue,
//                                     icon: const Icon(Icons.keyboard_arrow_down),
//                                     items: items.map((String items) {
//                                       return DropdownMenuItem(
//                                         value: items,
//                                         child: Text(items),
//                                       );
//                                     }).toList(),
//
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         dropdownvalue = newValue!;
//                                       });
//                                     },
//                                   ),
//
//
//                                   // DropdownButton(
//                                   //   value: startValue,
//                                   //     items: const [
//                                   //       DropdownMenuItem<int>(
//                                   //         value:1,
//                                   //         child:Text('1',)
//                                   //       ),
//                                   //       DropdownMenuItem<int>(
//                                   //           value:2,
//                                   //           child:Text('2',)
//                                   //       ),
//                                   //     ],
//                                   //   onChanged: ( newValue){
//                                   //     if(newValue is int) {
//                                   //       setState(() {
//                                   //         startValue = newValue;
//                                   //       });
//                                   //     }
//                                   //   },
//                                   //   icon: const Icon(Icons.keyboard_arrow_down_sharp)
//                                   //   ,),
//
//
//                                       //   DropdownMenuItem(
//                                       //       child:Text('1'),
//                                       //     value: 1,
//                                       //   ),
//                                       //   DropdownMenuItem(
//                                       //     child:Text('2'),
//                                       //     value: 2,
//                                       //   ),
//                                       // ].map((e) => ),
//                                   // DropdownMenu<int?>(
//                                   //     initialSelection: numbers.first,
//                                   //     onSelected: (int? value) {
//                                   //       // This is called when the user selects an item.
//                                   //       setState(() {
//                                   //         startValue = value ??0;
//                                   //       });
//                                   //     },
//                                   //     dropdownMenuEntries :numbers.map<DropdownMenuEntry<int>>((int? value) {
//                                   //      return DropdownMenuEntry<int>(
//                                   //       value: value!,label:value.toString() );
//                                   //
//                                   //      }).toList(),
//                                   //
//                                   // ),
//                                     //value: startValue,
//                                   //   items: numbers.map((number) => DropdownMenuItem<int?>(
//                                   //     value: number,
//                                   //     child: Text(number?.toString() ?? ''),
//                                   //   )).toList(),
//                                   //   onChanged: (newNumber) {
//                                   //     setState(() {
//                                   //       print('ggggggggggggg');
//                                   //       startValue = newNumber!;
//                                   //       print('ggggggggggggg');
//                                   //     });
//                                   //   },
//                                   // ),
//                                 ],
//                               ),
//
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Container(
//                             width: 333.h,
//                             height: 45,
//                             decoration: BoxDecoration(
//                                 color: AppColors.lightGrey.withOpacity(.2),
//                               borderRadius: BorderRadius.circular(5.0
//
//                             ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 3.0),
//                               child:  Row(
//                                 children: [
//                                   const CustomText(text:'- Select the ingredients -',
//                                       size: AppFontSize.s14),
//                                   const Spacer(),
//                                   DropdownButton(
//                                     value: dropdownvalue,
//                                     icon: const Icon(Icons.keyboard_arrow_down),
//                                     items: items.map((String items) {
//                                       return DropdownMenuItem(
//                                         value: items,
//                                         child: Text(items),
//                                       );
//                                     }).toList(),
//
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         dropdownvalue = newValue!;
//                                       });
//                                     },
//                                   ),
//
//
//                                   // DropdownButton(
//                                   //   value: startValue,
//                                   //     items: const [
//                                   //       DropdownMenuItem<int>(
//                                   //         value:1,
//                                   //         child:Text('1',)
//                                   //       ),
//                                   //       DropdownMenuItem<int>(
//                                   //           value:2,
//                                   //           child:Text('2',)
//                                   //       ),
//                                   //     ],
//                                   //   onChanged: ( newValue){
//                                   //     if(newValue is int) {
//                                   //       setState(() {
//                                   //         startValue = newValue;
//                                   //       });
//                                   //     }
//                                   //   },
//                                   //   icon: const Icon(Icons.keyboard_arrow_down_sharp)
//                                   //   ,),
//
//
//                                   //   DropdownMenuItem(
//                                   //       child:Text('1'),
//                                   //     value: 1,
//                                   //   ),
//                                   //   DropdownMenuItem(
//                                   //     child:Text('2'),
//                                   //     value: 2,
//                                   //   ),
//                                   // ].map((e) => ),
//                                   // DropdownMenu<int?>(
//                                   //     initialSelection: numbers.first,
//                                   //     onSelected: (int? value) {
//                                   //       // This is called when the user selects an item.
//                                   //       setState(() {
//                                   //         startValue = value ??0;
//                                   //       });
//                                   //     },
//                                   //     dropdownMenuEntries :numbers.map<DropdownMenuEntry<int>>((int? value) {
//                                   //      return DropdownMenuEntry<int>(
//                                   //       value: value!,label:value.toString() );
//                                   //
//                                   //      }).toList(),
//                                   //
//                                   // ),
//                                   //value: startValue,
//                                   //   items: numbers.map((number) => DropdownMenuItem<int?>(
//                                   //     value: number,
//                                   //     child: Text(number?.toString() ?? ''),
//                                   //   )).toList(),
//                                   //   onChanged: (newNumber) {
//                                   //     setState(() {
//                                   //       print('ggggggggggggg');
//                                   //       startValue = newNumber!;
//                                   //       print('ggggggggggggg');
//                                   //     });
//                                   //   },
//                                   // ),
//                                 ],
//                               ),
//
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Container(
//                             width: 333.h,
//                             height: 45,
//
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 3.0),
//                               child:  Row(
//                                 children: [
//                                   const CustomText(text:'Number of Portion',
//                                       size: AppFontSize.s14),
//                                   const Spacer(),
//                               Container(
//                                 width: 50,
//                                 height: 30,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.kPrimaryColor,
//                                   borderRadius: BorderRadius.circular(15),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 1,
//                                       color: AppColors.lightGrey
//                                     )
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Text('-',
//                                     style: TextStyle(color: AppColors.whiteColor,
//                                         fontSize: 18),),
//                                 ),
//                               ),
//                                   const SizedBox(width: 2),
//                                   Container(
//                                     width: 50,
//                                     height: 30,
//                                     decoration: BoxDecoration(
//                                       //  color: AppColors.kPrimaryColor,
//                                         borderRadius: BorderRadius.circular(15),
//                                       border: Border.all(color:AppColors.kPrimaryColor,),
//
//                                     ),
//                                     child: Center(
//                                       child: Text('1',
//                                         style: TextStyle(color: AppColors.kPrimaryColor,
//                                             fontSize: 15),),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 2),
//
//                                   Container(
//                                     width: 50,
//                                     height: 30,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.kPrimaryColor,
//                                         borderRadius: BorderRadius.circular(15),
//                                         boxShadow: [
//                                           BoxShadow(
//                                               blurRadius: 1,
//                                               color: AppColors.lightGrey
//                                           )
//                                         ]
//                                     ),
//                                     child: Center(
//                                       child: Text('+',
//                                       style: TextStyle(color: AppColors.whiteColor,
//                                       fontSize: 15),),
//                                     ),
//                                   ),
//                              ]
//                             ),
//                           ),
//                           ),
//                           Stack(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 8),
//                                 child: Container(
//                                   width: 90.w,
//                                   height: 150.h,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.kPrimaryColor,
//                                       borderRadius: BorderRadius.only(
//                                           topRight: Radius.circular(40),
//                                           bottomRight: Radius.circular(40))),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(top:20.0),
//                                 child: Center(
//                                   child: Container(
//                                     height: 122.h,
//                                     width: 260.w,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(topRight:Radius.circular(10),
//                                       topLeft:Radius.circular(40) ,
//                                       bottomLeft:Radius.circular(40) ,
//                                       bottomRight:Radius.circular(10) ),
//                                       color: Colors.white
//
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(top:13.0,bottom: 13),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//                                           CustomText(text: 'Total Price',
//                                           fontWeight: FontWeight.w400,
//                                           size: 14,),
//                                           CustomText(text: 'LKR 1500',
//                                             fontWeight: FontWeight.bold,
//                                             size: 18,),
//                                           Padding(
//                                             padding: const EdgeInsets.only(right: 20.0, left: 18),
//                                             child: Container(
//                                               //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                                               // padding: const EdgeInsets.only(right: 200.0),
//                                               width: 175,
//                                               height: 40,
//                                               decoration: BoxDecoration(
//                                                 color: AppColors.kPrimaryColor,
//                                                 borderRadius: BorderRadius.circular(100.0),
//                                               ),
//
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   IconButton(
//                                                       onPressed: () {},
//                                                       icon:  Icon(
//                                                         Icons.shopping_cart,
//                                                         size: 22,
//                                                         color: AppColors.whiteColor,
//                                                       )),
//                                                   Text(
//                                                     'Add To Cart',
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 15,
//                                                         fontWeight: FontWeight.w400),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//
//                             ],
//                           ),
//
//                         ],
//
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ]
        ),

      );
    }

  }

