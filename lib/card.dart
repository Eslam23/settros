import 'package:flutter/material.dart';
import 'info.dart';
import 'model/model_card.dart';
import 'online_image.dart';


class Card extends StatelessWidget {
  CardModel cardModel;
  Card(this.cardModel);
  @override
  Widget build(BuildContext context) {
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
              color: Colors.grey,
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileImage(
                      outlineIndicator: false,
                      onlineColor: Colors.green,
                      outlineColor: Colors.blueAccent,
                      imageUrl:
                          "https://image.flaticon.com/icons/png/512/3135/3135715.png",
                      size: 60.0,
                      onlineIndicator: true,
                      onPressed: () {},
                      backgroundColor: Colors.white),
                  /*
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      width: 60,
                      height: 60,
                      //image: AssetImage("assets/images/egypt.jpg"),
                      image: NetworkImage(
                          "https://image.flaticon.com/icons/png/512/3135/3135715.png"),
                    ),
                  ),
                  */

                  //Icon(Icons.group),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vistor',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Row(
                        children: [
                          Text(
                            'Cairo',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Egypt',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image(
                              width: 30,
                              height: 30,
                              //image: AssetImage("assets/images/egypt.jpg"),
                              image: NetworkImage(
                                  "https://image.flaticon.com/icons/png/512/2151/2151312.png"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  /*
                  SizedBox(
                    width: 250,
                  ),
                  */
                  //Text(
                  //'vistors',
                  //style: TextStyle(color: Colors.black),
                  //),
                  //Text(
                  //'30',
                  //style: TextStyle(color: Colors.black),
                  //),
                  //IconButton(onPressed: (), icon: (Icons.person)),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 5),
                      //Text(
                      //'Last Visit: ',
                      //style: TextStyle(color: Colors.black),
                      //),
                      Text(
                        '15 Aug, 01:32',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                  /*
                  Row(
                    children: [
                      Icon(
                        Icons.view_array,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 5),
                      //Text(
                      //'Last Visit: ',
                      //style: TextStyle(color: Colors.black),
                      //),
                      Text(
                        '30',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  */
                  //Text('30' , style: TextStyle(color: Colors.black),),
                  //IconButton(onPressed: (), icon: (Icons.person)),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WWW.LOG-APPS.COM',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Start Chatting",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  //Text('15 Aug, 01:32' , style: TextStyle(color: Colors.black),),
                  //Text('30' , style: TextStyle(color: Colors.black),),
                  //IconButton(onPressed: (), icon: (Icons.person)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
