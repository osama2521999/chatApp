import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/home/presentation/widgets/picture_item.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppConstants.mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.purpleAccent,),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal:  AppConstants.appPadding),
            child: Column(
              children: [
                Text('Login with your email or phone',style: TextStyle(fontSize: 24,color: Colors.white)),
                SizedBox(height:  context.height()/30,),

                TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      hintText: 'phone or email',
                      hintStyle: TextStyle(color: Colors.grey),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(height:  context.height()/50,),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(height:  context.height()/30,),
                Container(
                    width: context.width(),
                    height:context.height()/12 ,
                    decoration: BoxDecoration(
                      color: Color(0Xff303030),
                      borderRadius: BorderRadius.circular(AppConstants.buttonsBorderRadius)
                    ),
                    child: TextButton(onPressed: (){}, child: Text('Log in',style:  TextStyle(color: Colors.white),))),
                SizedBox(height:  context.height()/50,),
                Container(
                    width: context.width(),
                    height:context.height()/12 ,
                    decoration: BoxDecoration(
                      color: Color(0Xff303030),
                      borderRadius: BorderRadius.circular(AppConstants.buttonsBorderRadius)
                    ),
                    child: TextButton(onPressed: (){}, child: Text('Creat New Account ',style:  TextStyle(color: Colors.white),))),
                SizedBox(height:  context.height()/30,),
                TextButton(onPressed: (){}, child: Text('Forget Password?',style: TextStyle(color: Colors.blue),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
