import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/controllers/login_bloc/login_state.dart';
import 'package:restaurant_app/models/user_login_model.dart';
import 'package:restaurant_app/screens/layout_screen.dart';

import '../../models/register_model.dart';
import '../register_cubit/register_state.dart';

class AppLoginCubit extends Cubit<LoginStates>{
  AppLoginCubit() :super(AppLoginInitialState());

  static AppLoginCubit get(context)=>BlocProvider.of(context);


 // UserLoginModel model = UserLoginModel(
 //   email:'' ,
 //   password: '',
 // );
  FirebaseAuth auth = FirebaseAuth.instance;


Future<UserLoginModel> firebaseAuthenticate(BuildContext context,UserLoginModel model
)async{
  try {
    print(model.email);
 var response=  await auth.signInWithEmailAndPassword(
          email: model.email,
          password: model.password
 );

 emit(AppLoginSuccessState());
      print(auth.currentUser!.email);
      print(auth.currentUser!.uid);
        print('jjjjjjjjjjjj');
       // saveUserData(response);
    fetchUserData();
   //  await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid)
   //      .get().then((value) {
   //   // registerModel = UserRegisterModel.fromJson(value.data()!);
   //    print(value.data());
   //    print('ooooooooooooooooooooooooooooooooooooooooooooooooo');
   //    print(value.data());
   //   // emit(AppGetUserDataSuccessState());
   //  }).catchError((error) {
   //    print(error.toString());
   //  });
   // var user = await FirebaseFirestore.instance
   //      .collection('users')
   //      .doc(response.user?.uid)
   //      .get();

  }
   on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print('kkkkkkkkkkkkkkkkkkk');
    print(e.toString());
  }
  return model;
}
  Future<void> fetchUserData() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (!documentSnapshot.exists) {
      emit(AppUserFetchDataErrorState());
      return;
    }

    Map<String, dynamic> data = documentSnapshot.data()!;
    UserRegisterModel userRegisterModel = UserRegisterModel.fromJson(data);
    emit(AppUserFetchDataSuccessState(userRegisterModel: userRegisterModel));


  }
}