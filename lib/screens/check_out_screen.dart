import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';

import '../shared/components/app_fonts.dart';
import '../widgets/custom_app_bar_two.dart';
import '../widgets/custom_text.dart';
import 'item_details.dart';
import 'my_order_screen.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key,required this.iPrice});
  final double iPrice ;
 // int price =0;
  @override
  State<CheckOut> createState() => _CheckOutState();

}

class _CheckOutState extends State<CheckOut> {
  bool isPressed = true;
  bool isPressed2 = true;
  bool isPressed3 = true;
//double price =iPrice;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int price =22;
    int calculatePrice(int delivery, double itemPrice,int discount) {
      return (delivery + itemPrice - discount).toInt();
    }

    return Scaffold(
        body: Container(
            //padding: EdgeInsets.all(10),
            color: Colors.grey[100],
            child: Column(children: [
              Container(
                color: AppColors.whiteColor,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomAppBarTwo(title: 'CheckOut'),
                        CustomText(
                          text: 'Delivery Address',
                          color: AppColors.lightGrey,
                          size: 12,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          const Text(
                            //'',
                            // " ${cubit.currentPosition}",
                            'No 03, 4th Lane, Newyork',
                            style: TextStyle(
                                color: Color(0xff4A4B4D),
                                fontSize: 15,
                                textBaseline: TextBaseline.alphabetic),
                          ),
                          const Spacer(),
                          CustomText(
                            text: "Change",
                            color: AppColors.kPrimaryColor,
                            size: 14,
                          ),
                        ]),
                      ]),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                height: 250,
                width: 390,
                color: AppColors.whiteColor,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              //'',
                              // " ${cubit.currentPosition}",
                              'Payment Method',
                              style: TextStyle(
                                  color: Color(0xff4A4B4D), fontSize: 12),
                            ),
                            const Spacer(),
                            CustomText(
                              text: "+ Add Card",
                              color: AppColors.kPrimaryColor,
                              size: 12,
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 43,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const CustomText(
                              text: 'Cash On delievery',
                              size: 12,
                              fontWeight: AppFontWeight.bold,
                            ),
                            //SizedBox(width:30),

                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                  isPressed
                                      ? Icons.circle_outlined
                                      : Icons.circle,
                                  color: AppColors.kPrimaryColor,
                                  size: 15),
                              onPressed: () {
                                setState(() {
                                  isPressed = !isPressed;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 43,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("assets/images/visa.png"),
                            const SizedBox(width: 7),
                            const CustomText(
                              text: '**** **** **** 5287',
                              size: 12,
                              fontWeight: AppFontWeight.bold,
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                  isPressed2
                                      ? Icons.circle_outlined
                                      : Icons.circle,
                                  color: AppColors.kPrimaryColor,
                                  size: 15),
                              onPressed: () {
                                setState(() {
                                  isPressed2 = !isPressed2;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 43,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          // textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/paypal.png"),
                            const SizedBox(width: 7),
                            const CustomText(
                              text: '**** **** **** 1748',
                              size: 12,
                              fontWeight: AppFontWeight.bold,
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                  isPressed3
                                      ? Icons.circle_outlined
                                      : Icons.circle,
                                  color: AppColors.kPrimaryColor,
                                  size: 15),
                              onPressed: () {
                                setState(() {
                                  isPressed3 = !isPressed3;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: AppColors.whiteColor,
                height: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        width: 370,
                        height: 43,
                        color: AppColors.whiteColor,
                        child:   Row(
                          children: [
                            Text(
                              'Sub Total',
                              style: TextStyle(
                                  color: Color(0xff4A4B4D), fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              '\$$price',
                               // '\$${myOrderScreen.price.toInt() }',
                                style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        height: 22,
                        child: const Row(
                          children: [
                            Text(
                              'Delivery Cost',
                              style: TextStyle(
                                  color: Color(0xff4A4B4D), fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              '\$10',
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        height: 22,
                        child:  const Row(
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                  color: Color(0xff4A4B4D), fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              '\$15',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.lightGrey,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        height: 22,
                        child:   Row(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  color: Color(0xff4A4B4D), fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                            '\$${ calculatePrice((10),price.toDouble(),15)}',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  // height: 100,
                  //color: AppColors.whiteColor,
                  child: orangeButton(
                      text: 'Send Order',
                      function: () {
                        showDialog(
                            context: context,
                            builder: (context) => Center(
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        right: 10,
                                        // bottom: 30,
                                        left: 10,
                                        top: 30),
                                    width: 333,
                                    height: 620,
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 224,
                                            height: 245,
                                            // color: Colors.black,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SvgPicture.asset(
                                                    "assets/images/svg_images/sa.svg",
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            'Thank You! ',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                // height: 1.1,
                                                wordSpacing: 5.0,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: "Metropolis"),
                                            // fontSize: 22,
                                            // fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'check your order',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                height: 1.1,
                                                wordSpacing: 5.0,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontFamily: "Metropolis"),
                                          ),
                                          const SizedBox(height: 10),
                                          const Center(
                                            child: Text(
                                              'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  height: 1.1,
                                                  wordSpacing: 5.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                  color: Color.fromRGBO(
                                                      124, 125, 126, 106),
                                                  fontFamily: "Metropolis"),
                                            ),
                                            // color:
                                            // AppColors.kPrimaryColor,
                                            // fontSize: 14,
                                            // fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          orangeButton(
                                              text: 'Track My Order',
                                              function: () {}),
                                          defaultButton(
                                              text: 'Back To Home',
                                              color: AppColors.whiteColor,
                                              textColor: AppColors.blackColor,
                                              function: () {})
                                        ]))));
//     showDialog(
//     context: context,
//     builder: (context) =>
//   Center(
//     child: Container(
//       padding: const EdgeInsets.only(
//           right: 10,
//           //bottom: 30,
//           left: 10,
//           top: 30),
//       width: 320,
//       height: 600,
//       decoration: BoxDecoration(
//           color: AppColors.whiteColor,
//           borderRadius:
//           BorderRadius.circular(20)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//                 width:224,
//       height:154,
//       color: AppColors.blackColor,
//       child: Center(
//         child: Image.asset('assets/images/last.png',
//         fit: BoxFit.fill,),
//       )),
//           ),
//          Container(
//            height: 50,
//            width: 300,
//            child: CustomText(
//         text: "Thank You! for your order",
//              // style: TextStyle(
//              //   fontWeight: FontWeight.w400,
//              //   fontSize:26,
//              //
//              // ),
//
//               ),
//          ),
//          Container(
//             height: 200,
//             child: Text(
//                 'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
//               style: TextStyle(
//                 fontSize: 25
//               ),
//         ),
//           ),
//
//         ]
//       ),
//     ),
//   ),
//    );
//     }))
                      }))
            ])));
  }
}
