import 'package:chat_app/core/utils/common/custom_button.dart';
import 'package:chat_app/core/utils/common/spaces.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/common/custom_field.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controllers/login_controller.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  TextEditingController emailController = TextEditingController();
  bool isLoadingState = false;


  Future<void> forgetPass(BuildContext context) async {
    setState(() {
      isLoadingState = true;
    });
    var result = await LoginController().forgotPassword(emailController.text);
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
      Fluttertoast.showToast(
          msg: r,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        isLoadingState = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.mainColor,
        title: const Text(
          'Forget Password',
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
                  controller: emailController,
                  hintText: 'email',
                ),
                const GapH(height: 30),
                isLoadingState
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  width: context.width(),
                  height: context.height() / 12,
                  text: "forget",
                  onPressed: () async {
                    await forgetPass(context);
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
