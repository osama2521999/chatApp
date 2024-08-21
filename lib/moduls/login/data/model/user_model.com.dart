class UserModel{

 String uId;
 String name;
 String email;

 UserModel({required this.uId,required this.name,required this.email});

 factory UserModel.fromJson( Map<String,dynamic> json){
  return UserModel(
      uId: json['uid'],
      name: json['displayname'],
      email: json['email']);
  }
}