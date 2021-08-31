import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:service_system/account_setting_screen.dart';
import 'package:service_system/card_view.dart';
import 'package:service_system/client/client_chat_screen.dart';
import 'package:service_system/quad_clipper.dart';
import 'package:service_system/theme/color/light_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    bool selected = true;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _header(context),
            SizedBox(height: 6),
            CardView(
              name: "Ahmed",
              Country: "Egypt",
              city: "Cairo",
              Date: "15 Aug, 01:32:55",
              ip: "192:255:168:15",
              Redirect: "www.google.com",
              homePage: "www.souqq.com",
              label: "new",
            ),
            CardView(
              name: "Ahmed",
              Country: "Egypt",
              city: "Cairo",
              Date: "15 Aug, 01:32:55",
              ip: "192:255:168:15",
              Redirect: "www.google.com",
              homePage: "www.souqq.com",
              label: "old",
            ),
            CardView(
              name: "Ahmed",
              Country: "Egypt",
              city: "Cairo",
              Date: "15 Aug, 01:32:55",
              ip: "192:255:168:15",
              Redirect: "www.google.com",
              homePage: "www.souqq.com",
              label: "new",
            ),
            CardView(
              name: "Ahmed",
              Country: "Egypt",
              city: "Cairo",
              Date: "15 Aug, 01:32:55",
              ip: "192:255:168:15",
              Redirect: "www.google.com",
              homePage: "www.souqq.com",
              label: "old",
            ),
            CardView(
              name: "Ahmed",
              Country: "Egypt",
              city: "Cairo",
              Date: "15 Aug, 01:32:55",
              ip: "192:255:168:15",
              Redirect: "www.google.com",
              homePage: "www.souqq.com",
              label: "new",
            ),
            CardView(
              name: "Ahmed",
              Country: "Egypt",
              city: "Cairo",
              Date: "15 Aug, 01:32:55",
              ip: "192:255:168:15",
              Redirect: "www.google.com",
              homePage: "www.souqq.com",
              label: "new",
            ),
            //CardView(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(Icons.history, size: 30),
          Icon(Icons.report_gmailerrorred, size: 30),
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountSettingScreen()));
            },
          )
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

  Positioned _smallContainer(Color primary, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primary.withAlpha(255),
        ));
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool selected = true;
    //BuildContext context = context;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Container(
        height: 140,
        width: width,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 30,
                right: -100,
                child: _circularContainer(300, Colors.blue[300])),
            Positioned(
                top: -100,
                left: -45,
                child: _circularContainer(width * .5, Colors.blue[300])),
            Positioned(
                top: -180,
                right: -30,
                child: _circularContainer(width * .7, Colors.transparent,
                    borderColor: Colors.white38)),
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 0,
              child: Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showMenu<String>(
                              context: context,
                              position: RelativeRect.fromLTRB(25.0, 80.0, 25.0,
                                  0.0), //position where you want to show the menu on screen
                              items: [
                                PopupMenuItem<String>(
                                    child: const Text('Filter By Date'),
                                    value: '1'),
                                PopupMenuItem<String>(
                                    child: const Text('Filter By Country'),
                                    value: '2'),
                                PopupMenuItem<String>(
                                    child: const Text('Filter By City'),
                                    value: '3'),
                              ],
                              elevation: 8.0,
                            ).then<void>((String itemSelected) {
                              if (itemSelected == null) return;

                              if (itemSelected == "1") {
                                //code here
                              } else if (itemSelected == "2") {
                                //code here
                              } else {
                                //code here
                              }
                            });
                          },
                          //},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              width: 40,
                              height: 40,
                              image: AssetImage("assets/images/fiters.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            child: TextField(
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                  //BorderRadius.circular(50),
                                  // borderSide:
                                  //   BorderSide(color: Colors.blue, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.only(
                                  //  topLeft: Radius.circular(25),
                                  //bottomLeft: Radius.circular(25)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                  //BorderRadius.circular(50),
                                  // borderSide:
                                  //   BorderSide(color: Colors.blue, width: 1.0),
                                ),
                                labelText: 'Search',
                                labelStyle: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selected == true) {
                                    print('true');
                                    selected = false;
                                  } else {
                                    print('false');
                                    selected = true;
                                  }
                                  // selected = !selected;
                                });
                              },
                              child: selected == false
                                  ? Icon(
                                      Icons.volume_up,
                                      color: Colors.white,
                                      size: 30,
                                    )
                                  : Icon(
                                      Icons.volume_off,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                            ),
                            Text(
                              'Mute Sound',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            Text(
                              'Visitors',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '30000000',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* 
class _header extends StatefulWidget {
  

  @override
  __headerState createState() => __headerState();
}

class __headerState extends State<_header> {
  var width = MediaQuery.of(context).size.width;
  bool selected = true;
  @override
  Widget build(BuildContext context) {
     return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Container(
          height: 140,
          width: width,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 30,
                  right: -100,
                  child: _circularContainer(300, Colors.blue[300])),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _circularContainer(width * .5, Colors.blue[300])),
              Positioned(
                  top: -180,
                  right: -30,
                  child: _circularContainer(width * .7, Colors.transparent,
                      borderColor: Colors.white38)),
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 0,
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showMenu<String>(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                    25.0,
                                    80.0,
                                    25.0,
                                    0.0), //position where you want to show the menu on screen
                                items: [
                                  PopupMenuItem<String>(
                                      child: const Text('Filter By Date'),
                                      value: '1'),
                                  PopupMenuItem<String>(
                                      child: const Text('Filter By Country'),
                                      value: '2'),
                                  PopupMenuItem<String>(
                                      child: const Text('Filter By City'),
                                      value: '3'),
                                ],
                                elevation: 8.0,
                              ).then<void>((String itemSelected) {
                                if (itemSelected == null) return;

                                if (itemSelected == "1") {
                                  //code here
                                } else if (itemSelected == "2") {
                                  //code here
                                } else {
                                  //code here
                                }
                              });
                            },
                            //},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image(
                                width: 40,
                                height: 40,
                                image: AssetImage("assets/images/fiters.png"),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 6,
                          ),

                          Expanded(
                            child: Container(
                              height: 48,
                              child: TextField(
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(8),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    //BorderRadius.circular(50),
                                    // borderSide:
                                    //   BorderSide(color: Colors.blue, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    //borderRadius: BorderRadius.only(
                                    //  topLeft: Radius.circular(25),
                                    //bottomLeft: Radius.circular(25)),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    //BorderRadius.circular(50),
                                    // borderSide:
                                    //   BorderSide(color: Colors.blue, width: 1.0),
                                  ),
                                  labelText: 'Search',
                                  labelStyle: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selected == true) {
                                      print('true');
                                      selected = false;
                                    } else {
                                      print('false');
                                      selected = true;
                                    }
                                    // selected = !selected;
                                  });
                                },

                                child: selected == false
                                    ? Icon(
                                        Icons.volume_up,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.volume_off,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                
                              ),
                              Text(
                                'Mute Sound',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Row(
                            children: [
                              Text(
                                'Visitors',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              /*
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image(
                                  width: 25,
                                  height: 25,
                                  //image: AssetImage("assets/images/egypt.jpg"),
                                  image: AssetImage("assets/images/counts.png"),
                                ),
                              ),
                              */
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                '30000000',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );

  }
}
}
*/
/*
  Widget _decorationContainerB(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          right: -65,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.blue.shade100,
            child: CircleAvatar(radius: 30, backgroundColor: primary),
          ),
        ),
        Positioned(
            top: 35,
            right: -40,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: LightColor.lightseeBlue, radius: 40)))
      ],
    );
  }
  */
  /*

  Widget _decorationContainerC(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -105,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: LightColor.orange.withAlpha(100),
          ),
        ),
        Positioned(
            top: 35,
            right: -40,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: LightColor.orange, radius: 40))),
        _smallContainer(
          LightColor.yellow,
          35,
          70,
        )
      ],
    );
  }
  */
  /*

  Widget _decorationContainerD(Color primary, double top, double left,
      {Color secondary, Color secondaryAccent}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: secondary,
          ),
        ),
        _smallContainer(LightColor.yellow, 18, 35, radius: 12),
        Positioned(
          top: 130,
          left: -50,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: primary,
            child: CircleAvatar(radius: 50, backgroundColor: secondaryAccent),
          ),
        ),
        Positioned(
          top: -30,
          right: -40,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        )
      ],
    );
  }
  */
  /*

  Widget _decorationContainerE(Color primary, double top, double left,
      {Color secondary}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -105,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: primary.withAlpha(100),
          ),
        ),
        Positioned(
            top: 40,
            right: -25,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(backgroundColor: primary, radius: 40))),
        Positioned(
            top: 45,
            right: -50,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(backgroundColor: secondary, radius: 50))),
        _smallContainer(LightColor.yellow, 15, 90, radius: 5)
      ],
    );
  }
  */
  /*
  Widget _decorationContainerF(
      Color primary, Color secondary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 25,
            right: -20,
            child: RotatedBox(
              quarterTurns: 1,
              child: ClipRect(
                  clipper: QuadClipper(),
                  child: CircleAvatar(
                      backgroundColor: primary.withAlpha(100), radius: 50)),
            )),
        Positioned(
            top: 34,
            right: -8,
            child: ClipRect(
                clipper: QuadClipper(),
                child: CircleAvatar(
                    backgroundColor: secondary.withAlpha(100), radius: 40))),
        _smallContainer(LightColor.yellow, 15, 90, radius: 5)
      ],
    );
  }
  */