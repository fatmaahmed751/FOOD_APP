import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/models/dessert_model.dart';
import 'package:restaurant_app/widgets/menu_view.dart';
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

  List <DessertsModel> dessertsModel = [];

  List<Widget> bottomScreens = [
    const MenuView(),
    const OffersScreen(),
    const HomeScreen(),
    const ProfileScreen(),
    const MoreScreen(),
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
    print( "${currentPosition.latitude }' '${currentPosition.longitude}");
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    print(placemarks[0].subAdministrativeArea);
  }

  Future<Position> getCurrentPosition() async {

  return await Geolocator.getCurrentPosition().then((value) => value);

  }


}

