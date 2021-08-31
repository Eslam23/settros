import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final double textSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color textColor;
  final Widget suffixWidget;
  final Widget prefixWidget;
  PageHeader({this.title, this.textSize, this.fontWeight, this.backgroundColor, this.textColor, this.suffixWidget, this.prefixWidget});

  @override
  Widget build(BuildContext context) {

   /* double paddingRight() {
      if(suffixWidget == null){
        return 14.0;
      } else {
        return 10.0;
      }
    }

    double paddingLeft() {
      if(prefixWidget == null) {
        return 14.0;
      } else {
        return 10.0;
      }
    }*/

    double headerPadding() {
      if(prefixWidget == null) {
        return 0.0;
      } else {
        return 8.0;
      }
    }

    Color _backgroundColor() {
      if(backgroundColor != null){
        return backgroundColor;
      } else {
        return Theme.of(context).backgroundColor;
      }
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          stops: [
            0.0,
            0.7,
            1,
          ],
          colors: [
            _backgroundColor(),
            _backgroundColor().withOpacity(0.9),
            _backgroundColor().withOpacity(0.0),
          ]
        )
      ),
      /*padding: EdgeInsets.only(
        top: 20.0,
        left: 10,
        right: paddingRight(),
        bottom: 24.0,
      ),*/
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixWidget ?? SizedBox(width: 40,),
          Text(
            title ?? "Header",
            style: TextStyle(
             /* color: textColor ?? Theme.of(context).cardColor,*/
              fontSize: textSize ?? 30.0,
              fontWeight: fontWeight ?? FontWeight.w700
            ),
          ),
          suffixWidget??SizedBox(width: 40,),
        ],
      ),
    );
  }
}