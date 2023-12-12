import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({required this.c ,  this.cardChilde ,  this.onPress});
  final Widget ?cardChilde;
  final Color c ;
  final VoidCallback ?onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChilde,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}