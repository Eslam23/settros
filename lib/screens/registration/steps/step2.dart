import 'package:flutter/material.dart';
import 'package:service_system/widget/custom_textfield.dart';

class Step2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        //todo translate
        Text("Property Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
        Padding(
          padding: const EdgeInsets.all(10.0),
          //todo translate
          child: Text("Which website would you like to add a chat widget to?",style: TextStyle(fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
        ),
        SizedBox(height: 10,),
        CustomTextField(
          icon: Icons.language,
          //todo translate
          hint: "website name",
        ),
        SizedBox(height: 10,),
        CustomTextField(
          icon: Icons.link,
          //todo translate
          hint: "website url",
        ),
      ],
    );}}