import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:service_system/theme/theme.dart';

Widget CustomBtn(String text,Widget icon,Color color) {

  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: AppTheme.nearlyBlack,width: 0.2),
      color: color
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: icon,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white),
          ),
          SizedBox(width: 5,)
        ],
      ),
    ),
  );
}
Widget icon(IconData iconData) {
  return Icon(
    iconData,
    color: Colors.white,
  );
}