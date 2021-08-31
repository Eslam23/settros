import 'package:flutter/material.dart';

class VisitorWithName extends StatefulWidget {
  @override
  _VisitorWithNameState createState() => _VisitorWithNameState();
}

class _VisitorWithNameState extends State<VisitorWithName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitors With Name'),
        centerTitle: true,
      ),
    );
  }
}
