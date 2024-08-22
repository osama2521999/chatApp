class UserModel{

 // String uId;
 String name;
 String email;
 bool isActive;


 UserModel({required this.isActive,required this.name,required this.email});

 factory UserModel.fromJson(  json){
  return UserModel(
      isActive: json['isActive'],
      name: json['name'],
      email: json['email']);
  }
}