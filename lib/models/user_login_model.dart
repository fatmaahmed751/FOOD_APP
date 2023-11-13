class UserLoginModel {
  late String email;
  late String password;
 // late String uId;


  UserLoginModel({
    required this.email,
   required this.password,
   // this.uId=''

  });

  UserLoginModel.fromJson(Map<String ,dynamic> json){
email = json['email'];
password = json['password'];
 //uId:json['uId'];

  }
}
