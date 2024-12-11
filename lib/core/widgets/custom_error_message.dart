import 'package:ebook/core/utils/styles.dart';
import 'package:flutter/material.dart';
class CustomErrormessage extends StatelessWidget {
  const CustomErrormessage({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,style: Styles.textStyle18,
    );
  }
}
