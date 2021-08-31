import 'package:flutter/material.dart';

class VisitorWithoutName extends StatefulWidget {
  @override
  _VisitorWithoutNameState createState() => _VisitorWithoutNameState();
}

class _VisitorWithoutNameState extends State<VisitorWithoutName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Without Name'),
        centerTitle: true,
      ),
    );
  }
}
