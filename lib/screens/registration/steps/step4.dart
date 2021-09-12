import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:service_system/constant/constant.dart';
import 'package:service_system/constant/countries.dart';
import 'package:service_system/widget/custom_textfield.dart';

class Step4 extends StatelessWidget {
  double _height;
  double _width;
  double _padding;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _padding = _height * 0.015;
    // TODO: implement build
    return Column(
      children: [
        //todo translate
        Text("Confirm Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        SizedBox(height: _padding),
        form(),
        SizedBox(height: _padding),
      ],
    );
  }

  Widget form() {
    return Container(
        margin: EdgeInsets.all(10),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                fullNameTextFormField(TextEditingController(text: "Mohamed")),
                SizedBox(height: _padding),
                emailTextFormField(
                    TextEditingController(text: "Mohamed@gmail.com")),
                SizedBox(height: _padding),
                DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: countries,
                    //todo translate
                    label: "country",
                    //todo translate
                    hint: "Select your country",
                    showSearchBox: true,
                    onChanged: print,
                    selectedItem: "Egypt",
                  dropdownSearchDecoration: inputDecoration(),
                ),
                SizedBox(height: _padding,),
                phoneTextFormField(TextEditingController(text: "01123456789")),
                SizedBox(height: _padding),
              ],
            ),
          ),
        ));
  }

  Widget fullNameTextFormField(TextEditingController textEditingController) {
    return CustomTextField(
      textEditingController: textEditingController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      //todo translate
      hint: "Full Name"/*getTranslated(context, 'first_name')*/,
      enabled: false,

    );
  }

  Widget emailTextFormField(TextEditingController textEditingController) {
    return CustomTextField(
      textEditingController: textEditingController,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      //todo translate
      hint: "Email" /*getTranslated(context, 'email')*/,
      enabled: false,
    );
  }

  Widget phoneTextFormField(TextEditingController textEditingController) {
    return CustomTextField(
      textEditingController: textEditingController,
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      //todo translate
      hint: "Phone" /*getTranslated(context, 'mobile_number')*/,
    );
  }
}