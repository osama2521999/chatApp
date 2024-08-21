import 'package:chat_app/core/utils/common/custom_button.dart';
import 'package:chat_app/core/utils/common/spaces.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/common/custom_field.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controllers/login_controller.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController displayedNameController = TextEditingController();

  bool isLoadingState = false;

  Future<void> create(BuildContext context) async {
    setState(() {
      isLoadingState = true;
    });
    String email=emailController.text;
    String password=passwordController.text;
    String name=displayedNameController.text;

    var result = await LoginController().signUp( email,
        password, name);
    result.fold((l) {
      Fluttertoast.showToast(
          msg: "$l",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        isLoadingState = false;
      });
    }, (r) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.mainColor,
        title: const Text(
          'Create New User',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: AppConstants.mainColor,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: displayedNameController,
                  hintText: "Your Name",
                ),
                const GapH(height: 50),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'email',
                ),
                const GapH(height: 50),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const GapH(height: 30),
                isLoadingState
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        width: context.width(),
                        height: context.height() / 12,
                        text: "Create ",
                        onPressed: () async {
                          await create(context);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
