import 'package:flutter/material.dart';
import '../constants.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon , required this.onPress});
  final IconData ?icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon) ,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}