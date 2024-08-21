import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/constants/app_constants.dart';
import '../controllers/login_controller.dart';

class CreateUserScreen extends StatefulWidget {
   CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
TextEditingController emailController= TextEditingController();

TextEditingController passwordController= TextEditingController();

TextEditingController displayedNameController= TextEditingController();

bool isLoadingState=false;

Future<void> create( BuildContext context)async{
setState(() {
  isLoadingState=true;
});
 var result= await LoginController().signUp(
      emailController.text, passwordController.text,displayedNameController.text);
 result.fold((l){
   Fluttertoast.showToast(
       msg: "$l",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.grey,
       textColor: Colors.white,
       fontSize: 16.0);
   setState(() {
     isLoadingState=false;
   });
 },
         (r){
   Navigator.pop(context);
 });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.mainColor,
        title: Text('Create New User',style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: AppConstants.mainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(controller: displayedNameController,hintText: "Your Name",),
                SizedBox(
                  height: context.height() / 50,
                ),
                CustomTextFormField(controller: emailController,hintText: 'email',),
                SizedBox(
                  height: context.height() / 50,
                ),
                CustomTextFormField(controller: passwordController,hintText: 'Password',),
                SizedBox(
                  height: context.height() / 30,
                ),
                isLoadingState? CircularProgressIndicator()
                :Container(
                    width: context.width(),
                    height: context.height() / 12,
                    decoration: BoxDecoration(
                        color: Color(0Xff303030),
                        borderRadius: BorderRadius.circular(
                            AppConstants.buttonsBorderRadius)),
                    child:  TextButton(
                        onPressed: ()  async {
                        await create(context);
                        },
                        child: Text(
                          'Create ',
                          style: TextStyle(color: Colors.white),
                        ))),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
