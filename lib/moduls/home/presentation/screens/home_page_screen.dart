import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:chat_app/core/utils/extensions.dart';
import 'package:chat_app/moduls/home/presentation/widgets/picture_item.dart';
import 'package:flutter/material.dart';

import '../../../chat/presentation/screens/chat_screen.dart';
import '../widgets/story_item.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.mainColor,

      drawer: Drawer(

        backgroundColor: Colors.grey,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: AppConstants.mainColor,
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.appPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
              ),
              SizedBox(
                height: context.width() / 25,
              ),
              SizedBox(
                height: context.height() * .17,
                child: ListView.builder(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: StoryItem(),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsetsDirectional.fromSTEB(0,0,0,10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ChatScreen();
                        }));
                      },
                      child: Row(
                        children: [
                          PictureItem(),
                          SizedBox(width: context.width()/30,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name',style: TextStyle(color: Colors.white),),
                                Row(
                                  children: [Expanded(
                                    child: Text('this is a msg akjsjkahsjahsjhajhsjhsldsldkslkdlksldklskd',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey),),
                                  ),
                                    Text('12:00pm',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
                itemCount: 7,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
