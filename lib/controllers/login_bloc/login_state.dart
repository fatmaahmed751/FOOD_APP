import '../../models/register_model.dart';

class LoginStates{}

class AppLoginInitialState extends LoginStates{}

class AppLoadingState extends LoginStates{}

class AppLoginSuccessState extends LoginStates{}

class AppLoginErrorState extends LoginStates{}

class AppUserFetchDataErrorState extends LoginStates{}

class AppUserFetchDataSuccessState extends LoginStates{
 UserRegisterModel  userRegisterModel = UserRegisterModel();
 AppUserFetchDataSuccessState({required this.userRegisterModel});
}