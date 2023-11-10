class UserRegisterModel{
  late String name;
  late String email;
  late String password;
  late String address;
  late String confirmPassword;
  late String phone;
  late String uId;

  UserRegisterModel({

   this.name ='',
      this.email='',
      this.password='',
      this.address='',
      this.confirmPassword='',
      this.phone='',
     this.uId=''
  });
 factory UserRegisterModel.fromJson(Map<String,dynamic>json){

  return UserRegisterModel(
      name:json['name'],
      email:json['email'],
      phone:json['phone'],
      uId:json['uId'],
      confirmPassword:json['confirmPassword'],
      address:json['address'],
      password:json['password'],

  );

}
  Map<String,dynamic> toMap(){
   return{
     'name' :name,
     'address' :address,
     'phone' :phone,
     'email' :email,
     'uId' :uId,

   };
  }

  }