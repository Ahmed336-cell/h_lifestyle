import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableColumn extends StatelessWidget {
  ReusableColumn(this.icon ,this.text);
  final IconData icon;
  String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,style:labelTextStyle,
        )
      ],
    );
  }
}