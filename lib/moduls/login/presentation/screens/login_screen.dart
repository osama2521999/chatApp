import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/home/presentation/screens/home_page_screen.dart';
import 'package:chat_app/moduls/login/presentation/controllers/login_controller.dart';
import 'package:chat_app/moduls/login/presentation/screens/create_user_screen.dart';
import 'package:chat_app/moduls/login/presentation/screens/forget_pass.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/common/custom_button.dart';
import '../../../../core/utils/common/custom_field.dart';
import '../../../../core/utils/common/spaces.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
          msg: l,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r)async {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePageScreen(r?.displayName);
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
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppConstants.appPadding),
            child: Column(
              children: [
                const Text('Login with your email',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                const GapH(height: 30),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const GapH(height: 50),
                CustomTextFormField(
                  controller: passController,
                  hintText: 'Password',
                ),
                const GapH(height: 30),
                checkLogin
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        width: context.width(),
                        height: context.height() / 12,
                        text: 'Log in',
                        onPressed: () {
                          login();
                        },
                      ),
                const GapH(height: 30),
                CustomButton(
                  width: context.width(),
                  height: context.height() / 12,
                  text: 'Creat New Account ',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CreateUserScreen();
                    }));
                  },
                ),
                const GapH(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const ForgetPassScreen();
                        }));
                  },
                  child: const Text(
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
