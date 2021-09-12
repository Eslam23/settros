import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  Counter({this.color, this.textColor, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(
          horizontal: 10.0),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 6.5,
        vertical: 3.0,
      ),
      child: Text(
        text ?? "0",
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}