import 'package:chat_app/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PictureItem extends StatelessWidget {
  const PictureItem({
     this.radius=AppConstants.mainPictureRadius,
     this.activeStatusRadius=7,
     this.rightPosition=5,
     this.bottomPosition=10,

    super.key,
  });
   final double radius;
   final double activeStatusRadius;
final double rightPosition;
final double bottomPosition;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: radius,
        ),
        Positioned(
            right : rightPosition,
            bottom: bottomPosition,
            child: CircleAvatar(radius:activeStatusRadius,backgroundColor: Colors.green)),
      ],
    );
  }
}

class SmallPictureItem extends PictureItem{

  SmallPictureItem():super( radius: AppConstants.smallPictureRadius,rightPosition:2,bottomPosition: 2 ,activeStatusRadius: 6 );

}