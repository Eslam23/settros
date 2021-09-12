import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                              //image: AssetImage("assets/images/egypt.jpg"),
                              image: AssetImage("assets/images/fiters.png"),
                            ),
                          ),
                        ),
                        /*
                          IconButton(
                            onPressed: () {
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

                            icon: Icon(
                              Icons.filter_list,
                              size: 36,
                              color: Colors.white,
                            ),
                          ),
                          */

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
                                /*
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)),
                                //borderSide:
                                //  BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              */

                                //labelText: 'Type Search...',
                                //labelStyle: TextStyle(color: Colors.grey),
                                // hintText: "Type Search...",
                                //hintStyle:
                                //  TextStyle(color: Colors.grey[400]),
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
                        //("https://image.flaticon.com/icons/png/512/864/864938.png");
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
                            InkWell(
                              onTap: () {
                                  if (selected == true) {
                                    selected = false;
                                  } else {
                                    selected = true;
                                  }
                                  // selected = !selected;
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
                              //iconIcons.volume_up,
                            ),
                            /*
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = !selected;
                                  });
                                },
                                child: ClipRRect(
                                  //borderRadius: BorderRadius.circular(5.0),
                                  child: Image(
                                    width: 30,
                                    height: 30,

                                    //image: AssetImage("assets/images/egypt.jpg"),
                                    image: selected == true
                                        ? AssetImage(
                                            "assets/images/no_sound.png")
                                        : AssetImage("assets/images/sound.png"),
                                  ),
                                ),
                              ),
                              */
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