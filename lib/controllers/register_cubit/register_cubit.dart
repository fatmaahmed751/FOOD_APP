import 'package:firebase_auth/firebase_auth.dart';
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
 final response=  await auth.createUserWithEmailAndPassword(
          email: registerModel.email,
          password: registerModel.password
        //print('jjjjjjjjjjjj');
      );
 emit(AppRegisterSuccessState());
      print(auth.currentUser!.email);
      print(auth.currentUser!.uid);
        print('jjjjjjjjjjjj');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print('kkkkkkkkkkkkkkkkkkk');
    print(e.toString());
    emit(AppRegisterErrorState());
  }
  return registerModel;
}







}