import 'package:flutter/material.dart';
import 'package:service_system/theme/theme.dart';

InputDecoration inputDecoration(){
  return  InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.appColor, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey,width: 0.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey,width: 0.5),
    ),
  );
}
/*
*
* var email = "tony@starkindustries.com"
bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$

*
*
* */