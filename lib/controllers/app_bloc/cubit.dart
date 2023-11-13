import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/models/dessert_model.dart';
import 'package:restaurant_app/models/recent_items_model.dart';
import 'package:restaurant_app/widgets/menu_view.dart';
import '../../models/register_model.dart';
import '../../models/restaurant_model.dart';
import '../../screens/home_screen.dart';
import '../../screens/more_screen.dart';
import '../../screens/offers_screen.dart';
import '../../screens/profile_screen.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

//CurrentBottomNavIndex
  int bottomNavCurrentIndex = 0;

  List<String> items = [
    'Menu',
    'Offers',
    ' ',
    'Profile',
    'More',
  ];
  UserRegisterModel? registerModel ;
  List <DessertsModel> dessertsModel = [];
  List <RecentItemModel> recentModel = [];
  List <RestaurantModel> restaurantModel = [];


  List<Widget> bottomScreens = [
    const MenuView(),
    const OffersScreen(),
    const HomeScreen(),
    const ProfileScreen(),
    MoreScreen(),
  ];

  void changeBottomNav(int index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavBarState());
  }


  Future getData() async {
    FirebaseFirestore.instance.collection('desserts')
        .get().then((value) {
      value.docs.forEach((element) {
        dessertsModel.add(DessertsModel.fromJson(element.data()));
      });
      emit(GetDessertsSuccessState());
      print(dessertsModel);
    }).catchError((error) {
      emit(GetDessertsErrorState());
      print(error.toString());
    });
  }

  Future getRestaurant() async {
    FirebaseFirestore.instance.collection('restaurants')
        .get().then((value) {
      value.docs.forEach((element) {
        restaurantModel.add(RestaurantModel.fromJson(element.data()));
      });
      emit(GetRestaurantSuccessState());
      print(restaurantModel.length);
    }).catchError((error) {
      emit(GetRestaurantErrorState());
      print(error.toString());
    });
  }

  Future getRecentItems() async {
    FirebaseFirestore.instance.collection('recent_items')
        .get().then((value) {
      value.docs.forEach((element) {
        recentModel.add(RecentItemModel.fromJson(element.data()));
        print(element.data()['ingredients']);
      });
      emit(GetRecentItemsSuccessState());
      // print(element.data());
    }).catchError((error) {
      emit(GetRecentItemsErrorState());
      print(error.toString());
    });
  }

  void getSubCollection() {
    FirebaseFirestore.instance.collection('recent_items')
        .get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection('recent_items')
            .doc(element.id).collection('ingredients').get().
        then((value) {
          value.docs.forEach((element) {
            recentModel.add(RecentItemModel.fromJson(element.data()));

            print(element.data());
          });
          emit(GetRecentItemsSuccessState());
        }).catchError((error) {
          emit(GetRecentItemsErrorState());
          //print(error.toString());
        });
        // });

        recentModel.add(RecentItemModel.fromJson(element.data()));
        print(element.data().toString());
      });
    });
  }



  // return FutureBuilder<DocumentSnapshot>(
  //
  //  future: users.doc(registerModel.uId);
  //  builder:
  //  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //
  //  if (snapshot.hasError) {
  //  return Text("Something went wrong");
  //  }
  //
  //  if (snapshot.hasData && !snapshot.data!.exists) {
  //  return Text("Document does not exist");
  //  }
  //
  //  if (snapshot.connectionState == ConnectionState.done) {
  //  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
  //  return Text("Full Name: ${data['full_name']} ${data['last_name']}");
  //  }
  //
  //  return Text("loading");
  //  },
  //
  //  );

  //   if(userRegisterModel.uId != null && userRegisterModel.uId.isNotEmpty  ) {
  //     await FirebaseFirestore.instance.collection('users').doc(
  //         userRegisterModel.uId)
  //         .get().then((value) {
  //       userRegisterModel = UserRegisterModel.fromJson(value.data()!);
  //       emit(AppGetUserDataSuccessState());
  //       print(userRegisterModel.uId);
  //       print('ooooooooooooooooooooooooooooooooooooooooooo');
  //     }).catchError((error) {
  //       print(error.toString());
  //       // emit(AppGetUserDataErrorState());
  //     });
  //     print('${userRegisterModel.uId}''hhhhhhhhhhhhhhhhhhhhhh');
  //     return userRegisterModel;
  //     print('${registerModel.uId}''hhhhhhhhhhhhhhhhhhhhhhkkkkk');
  //   }else{
  //     print('ui id is empty');
  //   }
  //   return userRegisterModel;
  // }

  Future getNotification() async {
    String? myToken = await FirebaseMessaging.instance.getToken();
    print('=====================================');
    print(myToken);
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrderScreen()));
  }

  // Future getLocation()async{
  //    await
  // }
  bool ser = false;
  late Position currentPosition;

  Future getPosition() async {
    ser = await Geolocator.isLocationServiceEnabled();
    print(ser);
    LocationPermission per;

    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    currentPosition = await getCurrentPosition();
    print("${currentPosition.latitude }' '${currentPosition.longitude}");
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    print(placemarks[0].subAdministrativeArea);
  }

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }


}