import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:service_system/constant/constant.dart';

class Step1 extends StatelessWidget{
  /*String selected ;

  Step1(this.selected);
*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: _languages,
      //todo translate
      label: "Select Language",
     /* selectedItem: selected,*/
      onSaved: (selected) =>selected =selected,
      showSearchBox: false,
      onChanged: print,
      dropdownSearchDecoration: inputDecoration(),
    );
  }
}
List <String> _languages= [
  "English (United States)",
  "français",
  "italiano",
  "Deutsch",
  "español",
  "हिंदी",
  "magyar",
  "한국어",
  "Nederlands",
  "polski",
  "română",
  "Русский",
  "slovenčina",
  "svenska",
  "Türkçe",
  "Tiếng Việt",
  "български",
  "العربية"

];