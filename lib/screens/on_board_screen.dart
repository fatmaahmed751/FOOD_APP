import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();
  List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
        image: 'assets/images/Find food you l.png',
        text: 'Find Food You Love',
        subText: 'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep'
    ),
    OnBoardingModel(
        image: 'assets/images/delivery.png',
        text: 'Fast Delivery',
        subText: 'Fast food delivery to your home, office wherever you are'
    ),
    OnBoardingModel(
        image: 'assets/images/live.png',
        text: 'Live Tracking',
        subText: 'Real time tracking of your food on the app once you placed the order'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
            controller: boardController,
            itemBuilder: (context, index) =>
                onBoardingWidget(onBoarding[index]),
            itemCount: onBoarding.length,)
      ),
    );
  }

  Widget onBoardingWidget(OnBoardingModel model) =>
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Image(image: AssetImage("${model.image}"),
            ),
            SizedBox(height: 30,),
            SmoothPageIndicator(
        controller: boardController,
        count: 3,
        axisDirection: Axis.horizontal,
        effect: ScrollingDotsEffect(
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
            SizedBox(height: 30,),
            screenText(
                text: '${model.text}',
                fontWeight: FontWeight.w400,
                fontSize: 26,
                color: Color(0xff4a4b4d)
            ),
            SizedBox(height: 30,),
            Container(
              width: 272,
              height: 52,
              child: Align(
                alignment: Alignment.center,
                child: screenSubText(
                  text: "${model.subText} ",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7c7d7e),
                ),
              ),
            ),
            SizedBox(height: 30,),
           // orangeButton(text: 'Next'),
          ],
        ),
      );
}