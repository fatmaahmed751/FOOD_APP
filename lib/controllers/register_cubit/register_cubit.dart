import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/controllers/login_bloc/login_state.dart';
import 'package:restaurant_app/controllers/register_cubit/register_state.dart';
import 'package:restaurant_app/models/register_model.dart';
import 'package:restaurant_app/models/user_login_model.dart';

class AppRegisterCubit extends Cubit<RegisterStates>{
  AppRegisterCubit() :super(AppRegisterInitialState());

  static AppRegisterCubit get(context)=>BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

Future<UserRegisterModel> firebaseAuthenticate(UserRegisterModel registerModel
)async{
  try {
    emit(AppRegisterInitialState());
   await auth.createUserWithEmailAndPassword(
          email: registerModel.email,
          password: registerModel.password

      );
    saveUserData(uId:auth.currentUser!.uid,
      name: registerModel.name,
       // auth.currentUser.toString(),
   // phone: auth.currentUser!.phoneNumber!,
   //    email: auth.currentUser!.email!,
    );

    emit(AppRegisterSuccessState());
// print(registerModel.uId);
// print('hhhhhhhhhhhhhhhhhhhwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwhhhhhhhhhh');


 print(auth.currentUser!.email);
      print(auth.currentUser!.uid);
        print('jjjjjjjjjjjj');
//if(response.user != null) {

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
   // emit(AppRegisterErrorState());
    print(e.toString());

  }

  return registerModel;

}
///TODO
  ///to save user data in firestore i must to do method creatuser with uid

  Future<UserRegisterModel> saveUserData({

    required String uId,
    required String name,
    // required String phone,
    // required String email,
})async{
    UserRegisterModel userRegisterModel=UserRegisterModel(
    );
    await FirebaseFirestore.instance.collection('users').
    doc(uId).
    set({
     "uId" :userRegisterModel.uId,
      "name" :userRegisterModel.name,
      // "email" :userRegisterModel.email,
      // "password" :userRegisterModel.password,
      // "confirmPassword" :userRegisterModel.confirmPassword,
      // "phone" :userRegisterModel.phone,

    }).then((value) {
      print(uId);
      emit(AppCreateSuccessState());
    }).catchError((e){
      //emit(AppCreateErrorState());
      print(e.toString());
    });
    return userRegisterModel;
  }






}