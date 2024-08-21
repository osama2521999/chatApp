import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/home/presentation/screens/home_page_screen.dart';
import 'package:chat_app/moduls/login/presentation/controllers/login_controller.dart';
import 'package:chat_app/moduls/login/presentation/screens/create_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  bool checkLogin = false;

  void login() async {
    setState(() {
      checkLogin = true;
    });

    var result = await LoginController()
        .signInEmail(emailController.text, passController.text);
    result.fold((l) {
      Fluttertoast.showToast(
          msg: "$l",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePageScreen( r?.displayName);
      }));
    });
    setState(() {
      checkLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppConstants.mainColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppConstants.appPadding),
            child: Column(
              children: [
                Text('Login with your email',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(
                  height: context.height() / 30,
                ),
                CustomTextFormField(
                  controller: emailController,
                      hintText: 'Email',
                      ),
                SizedBox(
                  height: context.height() / 50,
                ),
                CustomTextFormField(controller: passController,hintText: 'Password',),
                SizedBox(
                  height: context.height() / 30,
                ),
                checkLogin
                    ? CircularProgressIndicator()
                    : Container(
                        width: context.width(),
                        height: context.height() / 12,
                        decoration: BoxDecoration(
                            color: Color(0Xff303030),
                            borderRadius: BorderRadius.circular(
                                AppConstants.buttonsBorderRadius)),
                        child: TextButton(
                            onPressed: () {
                              login();
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Colors.white),
                            ))),
                SizedBox(
                  height: context.height() / 50,
                ),
                Container(
                    width: context.width(),
                    height: context.height() / 12,
                    decoration: BoxDecoration(
                        color: Color(0Xff303030),
                        borderRadius: BorderRadius.circular(
                            AppConstants.buttonsBorderRadius)),
                    child: TextButton(
                        onPressed: ()  {
                          Navigator.push(context, MaterialPageRoute(builder: (context){return CreateUserScreen();}));
                        },
                        child: Text(
                          'Creat New Account ',
                          style: TextStyle(color: Colors.white),
                        ))),
                SizedBox(
                  height: context.height() / 30,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    required this.controller, this.color, this.textColor, this.hintColor, this.hintText,
    this.validator,this.onFieldSubmitted,this.keyboardType,this.obscureText
  });

  final TextEditingController controller;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final String? hintText;
  String? Function(String?)? validator;
  void Function(String?)? onFieldSubmitted;
  bool? obscureText ;
  TextInputType? keyboardType ;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: validator ,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText??false ,
      keyboardType: keyboardType   ,
      controller: controller,
      style: TextStyle(color: textColor??Colors.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color:hintColor?? Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
