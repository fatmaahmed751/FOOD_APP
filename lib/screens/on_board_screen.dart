import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/components/app_colors.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'first_page.dart';
class OnBoardingModel{
  final String image;
  final String text;
  final String subText;

  OnBoardingModel({
    required this.image,
    required this.text,
    required this.subText
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
        image: 'assets/images/onboarding1.png',
        text: 'Find Food You Love',
        subText: 'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep'
    ),
    OnBoardingModel(
        image: 'assets/images/svg_images/de.png',
        text: 'Fast Delivery',
        subText: 'Fast food delivery to your home, office wherever you are'
    ),
    OnBoardingModel(
        image: 'assets/images/onboarding3.png',
        text: 'Live Tracking',
        subText: 'Real time tracking of your food on the app once you placed the order'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
            controller: boardController,
            onPageChanged: (int index){
              if(index == onBoarding.length-1)
              {
                setState(() {
                  isLast= true;
                });
              }else{
                isLast= false;
              }
            },
            itemBuilder: (context, index) =>
                onBoardingWidget(onBoarding[index],context),
            itemCount: onBoarding.length,)
      ),
    );
  }

  Widget onBoardingWidget(OnBoardingModel model,context) =>
      Padding(
        padding: const EdgeInsets.only(left:20.0,right:10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>FirstPage()));
              }, child: Text('SKIP',
              style: TextStyle(color: AppColors.kPrimaryColor),)),
            ),
            Container(
              height:onBoarding.length == 1?300 :400,
              child: Image(image: AssetImage("${model.image}"),
              ),
            ),
            const SizedBox(height: 20,),
            SmoothPageIndicator(
        controller: boardController,
        count: onBoarding.length,
        axisDirection: Axis.horizontal,
        effect: const ScrollingDotsEffect(
            spacing:  8.0,
            radius:  4.0,
            dotWidth:  8.0,
            dotHeight:  8.0,
            paintStyle:  PaintingStyle.fill,
            strokeWidth:  1.5,
            dotColor:  Colors.grey,
            activeDotColor:  Colors.deepOrange
        ),
      ),
            const SizedBox(height: 30,),
            screenText(
                text: '${model.text}',
                fontWeight: FontWeight.w400,
                fontSize: 26,
                color: const Color(0xff4a4b4d)
            ),
            const SizedBox(height: 30,),
            Container(
              width: 272,
              height: 52,
              child: Align(
                alignment: Alignment.center,
                child: screenSubText(
                  text: "${model.subText} ",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff7c7d7e),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            //orangeButton(text: 'Next', function:(){}),
          ],
        ),
      );
}