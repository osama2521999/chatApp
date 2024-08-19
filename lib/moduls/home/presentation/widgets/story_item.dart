import 'package:chat_app/moduls/home/presentation/widgets/picture_item.dart';
import 'package:flutter/material.dart';


class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PictureItem(),
        Text(" Name",style: TextStyle(color: Colors.white),),
      ],
    );
  }
}
