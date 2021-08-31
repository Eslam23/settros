import 'package:flutter/material.dart';
import 'package:service_system/client/client_chat_screen.dart';
import 'package:service_system/product_details.dart';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String imgUrl;
  String Status;
  String ProductName;
  String Price;
  String Description;
  bool offered;
  ProductCard({
    this.ProductName,
    this.imgUrl,
    this.Status,
    this.Price,
    this.Description,
    this.offered,
  });

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_hieght = MediaQuery.of(context).size.height;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(5.0),
                      ),
                      child: Image(
                        // width: 30,
                        height: 200,
                        width: MediaQuery.of(context).size.width - 10,
                        fit: BoxFit.fill,
                        //image: AssetImage("assets/images/egypt.jpg"),
                        image: AssetImage(imgUrl),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                ProductName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  Description,
                  style: TextStyle(
                      color: Colors.black,
                      //fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Status',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          Status,
                          style: TextStyle(
                              color: Colors.blue,
                              //fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Price,
                            style: TextStyle(
                                color: Colors.blue,
                                //fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),

              //Divider(),

              //Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
