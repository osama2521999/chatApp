import 'package:chat_app/core/utils/common/custom_field.dart';
import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/home/presentation/widgets/picture_item.dart';
import 'package:chat_app/moduls/login/data/model/user_model.com.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen(this.user,{super.key});
   TextEditingController messageController=TextEditingController();
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppConstants.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.purpleAccent,),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            SmallPictureItem(),
            SizedBox(width: context.width()/30,),
            Text('${user.name}',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(controller: messageController,hintText: 'Message',),
          )
        ],
      ),
    );
  }
}
