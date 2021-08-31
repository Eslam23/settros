import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/client/client_chat_screen.dart';
import 'package:service_system/info.dart';
//import 'package:login_system/online_image.dart';

class CardVisitor extends StatelessWidget {
  // icon chat
  String name;
  String Country;
  String location;
  String visit_page;
  String last_visit;
  String email;
  String mac_address;
  String phone_name;
  String phone_type;
  String browser;
  String windows_type;
  String city;
  //String Date;
  String Redirect;
  String Location;
  String ip;
  String homePage;
  //String label;
  CardVisitor({
    this.name,
    this.Country,
    this.city,
    this.Redirect,
    this.browser,
    this.email,
    this.last_visit,
    this.location,
    this.ip,
    this.homePage,
    this.mac_address,
    this.phone_name,
    this.phone_type,
    this.visit_page,
    this.windows_type,
    //this.Date,
    //this.Redirect,5
  });
  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 2.5,
                spreadRadius: 2.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              Text(
                                Country,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IP',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              ip,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              Text(
                                city,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Redirect',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Text(
                              Redirect,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //Divider(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 2.5,
                spreadRadius: 2.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Visited',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              Text(
                                last_visit,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Home Page',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  homePage,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            ),
                            /*
                            Text(
                              'Chatting',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ClientChatScreen()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image(
                                  width: 35,
                                  height: 35,
                                  //image: AssetImage("assets/images/egypt.jpg"),
                                  image: AssetImage("assets/images/comm.png"),
                                ),
                              ),
                            ),
                            */
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Text(
                                location,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Browser',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  browser,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Divider(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 2.5,
                spreadRadius: 2.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Text(
                                name,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mac Address',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  mac_address,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Text(
                                email,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  phone_name,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Type',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              Text(
                                phone_type,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Windows Type',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  windows_type,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            'GPS',
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 2.5,
                spreadRadius: 2.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  // borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    // width: 30,
                    height: 200,
                    width: MediaQuery.of(context).size.width - 18,
                    fit: BoxFit.cover,
                    //image: AssetImage("assets/images/egypt.jpg"),
                    image: AssetImage("assets/images/maps.png"),
                  ),
                ),
                //Divider(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
