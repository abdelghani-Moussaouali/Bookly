import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CustomLikeButton extends StatelessWidget {
  const CustomLikeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LikeButton(
      circleSize: 2,
      size: 25,
      circleColor: CircleColor(start: Colors.amber, end: Colors.green),
      bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.black,
          dotSecondaryColor: Colors.yellow,
          dotLastColor: Colors.green,
          dotThirdColor: Colors.blue
          ),
    );
  }
}
