import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/client/client_chat_screen.dart';
import 'package:service_system/info.dart';
//import 'package:login_system/online_image.dart';

class CardView extends StatelessWidget {
  String name;
  String Country;
  String city;
  String Date;
  String Redirect;
  String ip;
  String homePage;
  String label;
  CardView(
      {this.name,
      this.Country,
      this.city,
      this.Date,
      this.Redirect,
      this.ip,
      this.homePage,
      this.label});
  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InformationScreen()));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          width: 30,
                          height: 30,
                          //image: AssetImage("assets/images/egypt.jpg"),
                          image: AssetImage("assets/images/egyptt.png"),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                city,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Egypt',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      label == "old"
                          ? Row(
                              children: [
                                Text(
                                  'Last Visit',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '10 Aug, 01:22:50',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 10),
                                ),
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image(
                                width: 30,
                                height: 30,
                                //image: AssetImage("assets/images/egypt.jpg"),
                                image: AssetImage("assets/images/new.png"),
                              ),
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientChatScreen()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            width: 30,
                            height: 30,
                            //image: AssetImage("assets/images/egypt.jpg"),
                            image: AssetImage("assets/images/comm.png"),
                          ),
                        ),
                      ),
                      /*
                      Container(
                        height: 30,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(colors: [
                            Colors.blue,
                            Colors.blue[200],
                            //Color.fromRGBO(143, 148, 251, 1),
                            //Color.fromRGBO(143, 148, 251, .6),
                          ]),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Chatting",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      */
                      /*
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          width: 30,
                          height: 30,
                          //image: AssetImage("assets/images/egypt.jpg"),
                          image: AssetImage("assets/images/new.png"),
                        ),
                      ),
                      */
                    ],
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            width: 20,
                            height: 20,
                            //image: AssetImage("assets/images/egypt.jpg"),
                            image: AssetImage("assets/images/date.png"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '15 Aug, 01:32:55',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            width: 20,
                            height: 20,
                            //image: AssetImage("assets/images/egypt.jpg"),
                            image: AssetImage("assets/images/redirect.png"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Redirected',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'www.google.com',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //  Divider(),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            width: 20,
                            height: 20,
                            //image: AssetImage("assets/images/egypt.jpg"),
                            image: AssetImage("assets/images/ip.png"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'IP',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '192.255.168.15',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 52,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            width: 22,
                            height: 22,
                            //image: AssetImage("assets/images/egypt.jpg"),
                            image: AssetImage("assets/images/pages.png"),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HomePage',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'www.souqq.com',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    /*
                    Row(
                      children: [
                        Text(
                          'old visitor',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'www.chating.com',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                    */
                  ],
                ),
              ),

              //Divider(),
              /*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Address    ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Cairo , Egypt',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          width: 25,
                          height: 25,
                          //image: AssetImage("assets/images/egypt.jpg"),
                          image: NetworkImage(
                              "https://image.flaticon.com/icons/png/512/2151/2151312.png"),
                        ),
                      ),
                    ],
                  ),
                 
                ],
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
