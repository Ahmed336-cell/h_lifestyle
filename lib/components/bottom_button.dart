import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  final VoidCallback ?onPressd;
  final String ?label;
  BottomButton({required this.label,required this.onPressd});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressd,
      child: Container(
        child: Center(child: Text(label!,style: kLargeButtonTextStyle,)),
        color:bottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomButtonHeight,
      ),
    );
  }
}