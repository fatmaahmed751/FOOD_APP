import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../shared/components/app_colors.dart';



class RatingClass extends StatefulWidget {
  const RatingClass({super.key});

  @override
  RatingClassState createState() => RatingClassState();
}

class RatingClassState extends State<RatingClass> {
  late final ratingController;
  late double rating;

  double userRating = 3.0;
  int ratingBarMode = 1;
  double initialRating = 2.0;
  bool isRTLMode = false;
  bool isVertical = false;

  IconData? selectedIcon;

  @override
  void initState() {
    super.initState();
    ratingController = TextEditingController(text: '3.0');
    rating = initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: AppColors.kPrimaryColor,
      //   appBarTheme: AppBarTheme(
      //     titleTextStyle: Theme.of(context)
      //         .textTheme
      //         .headline6
      //         ?.copyWith(color: Colors.white),
      //   ),
      // ),
      home: Builder(
        builder: (context) => Scaffold(
          // appBar: AppBar(
          //   title: Text('Flutter Rating Bar'),
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.settings),
          //       color: Colors.white,
          //       onPressed: () async {
          //         selectedIcon = await showDialog<IconData>(
          //           context: context,
          //           builder: (context) => IconAlert(),
          //         );
          //         ratingBarMode = 1;
          //         setState(() {});
          //       },
          //     ),
          //   ],
          // ),
          body: Directionality(
            textDirection: isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // SizedBox(
                //   height: 40.0,
                // ),
                //heading('Rating Bar'),
                ratingBar(ratingBarMode),
                SizedBox(height: 10.0),
                // Text(
                //   'Rating: $rating',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
          //         SizedBox(height: 40.0),
          //         heading('Rating Indicator'),
          //         RatingBarIndicator(
          //           rating: userRating,
          //           itemBuilder: (context, index) => Icon(
          //             selectedIcon ?? Icons.star,
          //             color: Colors.amber,
          //           ),
          //           itemCount: 5,
          //           itemSize: 50.0,
          //           unratedColor: Colors.amber.withAlpha(50),
          //           direction: isVertical ? Axis.vertical : Axis.horizontal,
          //         ),
          //         SizedBox(height: 20.0),
          //         Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 16.0),
          //           child: TextFormField(
          //             controller: ratingController,
          //             keyboardType: TextInputType.number,
          //             decoration: InputDecoration(
          //               border: OutlineInputBorder(),
          //               hintText: 'Enter rating',
          //               labelText: 'Enter rating',
          //               suffixIcon: MaterialButton(
          //                 onPressed: () {
          //                   userRating =
          //                       double.parse(ratingController.text ?? '0.0');
          //                   setState(() {});
          //                 },
          //                 child: Text('Rate'),
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(height: 40.0),
          //         heading('Scrollable Rating Indicator'),
          //         RatingBarIndicator(
          //           rating: 8.2,
          //           itemCount: 20,
          //           itemSize: 30.0,
          //           physics: BouncingScrollPhysics(),
          //           itemBuilder: (context, index) => Icon(
          //             Icons.star,
          //             color: Colors.amber,
          //           ),
          //         ),
          //         SizedBox(height: 20.0),
          //         Text(
          //           'Rating Bar Modes',
          //           style: TextStyle(fontWeight: FontWeight.w300),
          //         ),
          //         Row(
          //           children: [
          //             radio(1),
          //             radio(2),
          //             radio(3),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text(
          //               'Switch to Vertical Bar',
          //               style: TextStyle(fontWeight: FontWeight.w300),
          //             ),
          //             Switch(
          //               value: isVertical,
          //               onChanged: (value) {
          //                 setState(() {
          //                   isVertical = value;
          //                 });
          //               },
          //               activeColor: Colors.amber,
          //             ),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text(
          //               'Switch to RTL Mode',
          //               style: TextStyle(fontWeight: FontWeight.w300),
          //             ),
          //             Switch(
          //               value: isRTLMode,
          //               onChanged: (value) {
          //                 setState(() {
          //                   isRTLMode = value;
          //                 });
          //               },
          //               activeColor: Colors.amber,
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
            ]
        ),
          ),
    )
      )
    );

  }

  Widget radio(int value) {
    return Expanded(
      child: RadioListTile<int>(
        value: value,
        groupValue: ratingBarMode,
        dense: true,
        title: Text(
          'Mode $value',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
          ),
        ),
        onChanged: (value) {
          setState(() {
            ratingBarMode = value!;
          });
        },
      ),
    );
  }

  Widget ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: initialRating,
          minRating: 1,
          direction: isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 10.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context,index ) => Icon(
            selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: initialRating,
          direction: isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: image('assets/heart.png'),
            half: image('assets/hearthalf.png'),
            empty: image('assets/heartborder.png'),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: initialRating,
          direction: isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  Widget heading(String text) => Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
    ],
  );
}

class IconAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Icon',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titlePadding: EdgeInsets.all(12.0),
      contentPadding: EdgeInsets.all(0),
      content: Wrap(
        children: [
          iconButton(context, Icons.home),
          iconButton(context, Icons.airplanemode_active),
          // iconButton(context, Icons.eurosymbol),
          // iconButton(context, Icons.beachaccess),
          // iconButton(context, Icons.attachmoney),
          // iconButton(context, Icons.musicnote),
          // iconButton(context, Icons.android),
          // iconButton(context, Icons.toys),
          // iconButton(context, Icons.language),
          // iconButton(context, Icons.landscape),
          // iconButton(context, Icons.acunit),
          // iconButton(context, Icons.star),
        ],
      ),
    );
  }

  Widget iconButton(BuildContext context, IconData icon) => IconButton(
    icon: Icon(icon),
    onPressed: () => Navigator.pop(context, icon),
    splashColor: Colors.amberAccent,
    color: Colors.amber,
  );
}
