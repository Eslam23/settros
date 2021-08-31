import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullView extends StatelessWidget{
  Widget child;

  FullView(this.child);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

}