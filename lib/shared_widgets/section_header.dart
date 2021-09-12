import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final double textSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final Color textColor;
  SectionHeader({this.title, this.textSize, this.fontWeight, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Text(
            title ?? "Section Header",
            style: TextStyle(
              color: textColor ?? Theme.of(context).primaryColor,
              fontWeight: fontWeight ?? FontWeight.w700,
              fontSize: textSize ?? 18.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            thickness: 1,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}