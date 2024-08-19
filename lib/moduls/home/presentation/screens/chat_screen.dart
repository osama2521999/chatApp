import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/home/presentation/widgets/picture_item.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
        title: Row(
          children: [
            SmallPictureItem(),
            SizedBox(width: context.width()/30,),
            Text('Chat Name',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}
