import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';

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
    await LoginController()
        .signInEmail(emailController.text, passController.text);
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
                Text('Login with your email or phone',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(
                  height: context.height() / 30,
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
                SizedBox(
                  height: context.height() / 50,
                ),
                TextFormField(
                  controller: passController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
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
                        onPressed: () async {
                          await LoginController().signUp(
                                  emailController.text, passController.text)
                              ? print('userCreated')
                              : print('failed');
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
