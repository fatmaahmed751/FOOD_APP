import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

//List of Item in TabBar
  List<String> items = [
    'Menu',
    'Offers',
    ' ',
    'Profile',
    'More',
  ];

  List<Widget> bottomScreens = [
    const MenuView(),
    const OffersScreen(),
    const HomeScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];



  //BottomNav
  void changeBottomNav(int index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavBarState());
  }
  List <DessertsModel> dessertsModel= [];

 getData()async{
     FirebaseFirestore.instance.collection('desserts')
   .get().then((value) {
     value.docs.forEach((element) {
       dessertsModel.add(DessertsModel.fromJson(element.data as Map<String, dynamic>));
     });
     emit(GetDessertsSuccessState());
     print(dessertsModel);
     }).catchError((error){
       emit(GetDessertsErrorState());
       print(error.toString());
     });
   }



   // for (DocumentSnapshot doc in querySnapshot.docs) {
   //   dessertsModel.add(DessertsModel.fromJson(doc.data()));
   // }
    //


  //}).catchError((onError){

  }
//   res.docs.forEach((element) {
//   dessertsModel.add(element.data());
// });




