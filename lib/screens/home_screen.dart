import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/screens/item_details.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/app_fonts.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/custom_text.dart';
import 'package:restaurant_app/widgets/popular_restaurant.dart';
import 'package:restaurant_app/widgets/search_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:carousel_slider/carousel_controller.dart';

import '../widgets/popular_restaurant.dart';
import '../widgets/popular_restaurant.dart';
import 'carousal_widget_model.dart';
import 'new.dart';

class CarousalModel
{
  final String image;
  final String text;

  CarousalModel
      ({
    required this.image,
    required this.text,
  });
}
class CarousalScreen extends StatefulWidget {
  @override
  State<CarousalScreen> createState() => _CarousalScreenState();
}

class _CarousalScreenState extends State<CarousalScreen> {

  List<CarousalModel> caro = [
    CarousalModel
      (
      image: 'assets/images/it.jpg',
      text: 'Italian',
    ),
    CarousalModel
      (
      image: 'assets/images/ko.jpg',
      text: 'Korean',
    ),
    CarousalModel
      (
      image: 'assets/images/rom.jpg',
      text: 'England',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          var recentItems = AppCubit
              .get(context)
              .recentModel;
          var restaurants = AppCubit
              .get(context)
              .restaurantModel;
         // CarousalModel model= CarousalModel(image:'',text:'');
          return Scaffold(
            body:
            SingleChildScrollView(
              child: Column(
                //  scrollDirection = Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const CustomAppBar(
                      title: 'Good Morning Fatma!',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Delivering to',
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB6B7B7)),
                          ),
                          Row(
                            children: [
                              Text(
                                'Current Location',
                                // textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.lightGrey),
                              ),
                              Center(
                                child: IconButton(
                                  onPressed: () async {
                                    await cubit.getPosition();
                                  },
                                  icon: Icon(Icons.arrow_drop_down_sharp,
                                      size: 30,
                                      color: AppColors.kPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),

                    const SearchBarWidget(),
                    CarouselSlider(items:  [
                    Container(

                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)

            ),
            child: Column(
              children: [
                Image.asset('assets/images/it.jpg',
                  width: 300.w,
                  height: 250.h,
                  fit: BoxFit.cover,),
               // Text('Italian')
              ],
            ),

          ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/com.jpg',
                              width: 300.w,
                              height: 250.h,
                              fit: BoxFit.cover,),
                            //Text('')
                          ],
                        ),

                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/ko.jpg',
                              width: 300.w,
                              height: 250.h,
                              fit: BoxFit.cover,),
                            //Text('Korean')
                          ],
                        ),

                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/rom.jpg',
                              width: 300,
                              height: 250.h,
                              fit: BoxFit.cover,),
                          //  Text('Roma')
                          ],
                        ),

                      ),
                      // scrollCategory(model),
                    ], options: CarouselOptions(
                        height: 280,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(seconds:1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                         viewportFraction: 1.0
                    ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 13),
                      child: Row(
                        children: [
                          CustomText(text: 'Popular Restaurant',
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeight.meduim,
                            size: AppFontSize.s18,),
                          const Spacer(),
                          CustomText(text: 'View All',
                            color: AppColors.kPrimaryColor,
                            size: AppFontSize.s14,
                          ),
                        ],
                      ),
                    ),

              Container(
                //color:Colors.red,
                //height:MediaQuery.of(context).size.height,
                 //height: 900.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => offerSFood(restaurants[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 9,
                    ),
                    itemCount: restaurants.length),
              ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 8),
                      child: Row(
                        children: [
                          CustomText(text: 'Recent Items',
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeight.bold,
                            size: AppFontSize.s18,),
                          const Spacer(),
                          CustomText(text: 'View All',
                            color: AppColors.kPrimaryColor,
                            size: AppFontSize.s14,
                          ),
                        ],
                      ),
                    ),
                    //New(),
                    Container(
                       //height: 500,
                      child: ListView.builder(
                        shrinkWrap: true,

                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            recentItemsContainer(recentItems[index], context),
                        itemCount: recentItems.length,
                      ),
                    )
                  ]
              ),

            ),
          );
        }
    );
    //  );
  }
  Widget popularRestaurant(restaurants)=> Container(
    //color:Colors.red,
    //height:MediaQuery.of(context).size.height,
    // height: 900.h,
    child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => offerSFood(restaurants[index]),
        separatorBuilder: (context, index) => const SizedBox(
          height: 9,
        ),
        itemCount: restaurants.length),
  );

  Widget offerSFood(restaurants) => Padding(
        padding: const EdgeInsets.only(left: 0.0,bottom:0,right: 0),
        child: Column(
          children: [
            Card(
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              margin: const EdgeInsets.only(bottom:10.0),
              child: Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.yellow,

                  // color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Image.network(
                  '${restaurants.image}',
                  // width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: '${restaurants.name}',
                  color: Colors.black,
                  size: AppFontSize.s18,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: AppColors.kPrimaryColor,
                  ),
                  CustomText(
                    text: '${restaurants.rate}',
                    color: AppColors.kPrimaryColor,
                    size: AppFontSize.s12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: '(${restaurants.rateNumber})',
                    color: AppColors.lightGrey,
                    size: AppFontSize.s15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  CustomText(
                    text: '${restaurants.type}',
                    color: AppColors.lightGrey,
                    size: AppFontSize.s15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  CustomText(
                    text: '${restaurants.categoryName}',
                    color: AppColors.lightGrey,
                    size: AppFontSize.s15,
                  ),

                ],
              ),
            ),
          ],
        ),
      );


    Widget recentItemsContainer(recentItems, context) =>
        Container(
         // color: Colors.red,
          height: 100,
          padding: const EdgeInsets.only(left: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ItemDetails(
                    image: '${recentItems.image}',
                    rate:   '${recentItems.rate}',
                    recipeName:'${recentItems.name}',
                    prices: recentItems.prices,
                      categoryName:"${recentItems.categoryName}" ,
                    type:"${recentItems.type}" ,
                  )));
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment
                    .baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),

                      ),
                      child: Image.network(
                        '${recentItems.image}',
                        fit: BoxFit.cover,
                        //  height: 95,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: [
                          Text(
                            '${recentItems.name}',
                            style:
                            const TextStyle(
                                color: Color(0xff4A4B4D),
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                                size: 17,
                              ),
                              Text(
                                '${recentItems.rate}',
                                style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text(
                                '(124 ratings)',
                                style: TextStyle(
                                    color: Color(0xff4A4B4D),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Row(
                            children: [
                               Text(
                                '${recentItems.type}',
                                style: TextStyle(
                                    color: Color(0xff4A4B4D),
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: AppColors.kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Text(
                                '${recentItems.categoryName}',
                                style: const TextStyle(
                                    color: Color(0xff4A4B4D),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ]
                    ),
                  ),
                ]
            ),
          )
        );


  Widget scrollCategory(CarousalModel model)=>Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
    ),
    child: Column(
        children: [
          Image.asset(model.image,
            width: 300,
            fit: BoxFit.cover,),
          Text(model.text)
        ],
      ),

  );
        // Column(
        //   children: [
        //     Image.network('https://media.gettyimages.com/id/129748962/photo/people-dining-inside-an-osteria.jpg?s=612x612&w=gi&k=20&c=ZxM7h_pz08Z7o1xnnRQ_KlnCsYN27yJePiT6r-jFw-s=',
        //       width: 300,
        //       fit: BoxFit.cover,),
        //     Text('italian')
        //   ],
        // ),


  }
