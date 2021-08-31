import 'package:flutter/material.dart';
//import 'package:hosting_app/localization/language_constants.dart';

enum MessageType { sent, received }

class ChatMessage extends StatelessWidget {
  final Widget message;
  final String sender;
  final MessageType messageType;
  final Color backgroundColor;
  final Color textColor;
  final String time;
  final bool showTime;
  final double maxWidth;
  final double minWidth;

  ChatMessage(
      {this.sender,
      this.message,
      this.messageType,
      this.backgroundColor,
      this.textColor,
      this.time,
      this.showTime,
      this.minWidth,
      this.maxWidth});

  CrossAxisAlignment messageAlignment() {
    if (messageType == null || messageType == MessageType.received) {
      return CrossAxisAlignment.start;
    } else {
      return CrossAxisAlignment.end;
    }
  }

  double topLeftRadius() {
    if (messageType == null || messageType == MessageType.received) {
      return 0.0;
    } else {
      return 12.0;
    }
  }

  double topRightRadius() {
    if (messageType == null || messageType == MessageType.received) {
      return 12.0;
    } else {
      return 0.0;
    }
  }

  Color messageBgColor(BuildContext context) {
    if (messageType == null || messageType == MessageType.received) {
      return Colors.blueGrey; // color of message
    } else {
      return Colors.blueAccent;
    }
  }

  Color messageTextColor(BuildContext context) {
    return Colors.white;
    /*if (messageType == null || messageType == MessageType.received) {
      return Colors.white;
    } else {
      return Theme.of(context).primaryColorDark;
    }*/
  }

  Text messageTime() {
    if (showTime != null && showTime == true) {
      return Text(
        time ?? "Time",
        style: TextStyle(
          fontSize: 12.0,
          color: Color(0xFF666666),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        //vertical: 2.0,
        horizontal: 5.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: _width - 10,
            child: Column(
              crossAxisAlignment: messageAlignment(),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  constraints: BoxConstraints(
                      minWidth: minWidth ?? _width * 0.2,
                      maxWidth: maxWidth ?? _width * 0.75),
                  decoration: BoxDecoration(
                    color: backgroundColor ?? messageBgColor(context),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(topLeftRadius()),
                      topRight: Radius.circular(topRightRadius()),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  padding: EdgeInsets.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: messageType == MessageType.sent
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      message,
                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Group Member',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Adel',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                      */

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          sender != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    /*getTranslated(context,*/ 'sent_by user adel'
                                    //" " +
                                    //sender
                                    ,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1:37 PM',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                        ],
                      ),
                      /*
                      sender != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                /*getTranslated(context,*/ 'sent_by' +
                                    " " +
                                    sender,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 9),
                              ),
                            )
                          : SizedBox()
                          */
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  child: messageTime(),
                ),
              ],
            ),
          ),
          /*
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 2),
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(5.0),
              child: Image(
                width: 16,
                height: 16,
                //image: AssetImage("assets/images/egypt.jpg"),
                image: AssetImage("assets/images/recieved.png"),
              ),
            ),
          )
          */
        ],
      ),
    );
  }
}
