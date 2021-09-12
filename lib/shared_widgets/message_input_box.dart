import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
//import 'package:hosting_app/chat/client/client_list.dart';
//import 'package:hosting_app/chat/shared_widgets/chat_message.dart';
//import 'package:hosting_app/constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_system/client/client_chat_screen.dart';
import 'package:service_system/client/client_list.dart';
import 'action_btn.dart';
import 'package:http/http.dart' as http;

import 'chat_message.dart';

class MessageInputBox extends StatefulWidget {
  final VoidCallback voidCallback;
  final Widget prefix;
  final Widget suffix;
  final bool roundedCorners;
  final Function onChanged;
  final Function onSubmitted;
  MessageInputBox(
      {this.prefix,
      this.suffix,
      this.roundedCorners,
      this.onChanged,
      this.onSubmitted,
      this.voidCallback});
  @override
  _MessageInputBoxState createState() => _MessageInputBoxState(
      prefix: this.prefix,
      suffix: this.suffix,
      roundedCorners: this.roundedCorners,
      onChanged: this.onChanged,
      onSubmitted: this.onSubmitted);
}

class _MessageInputBoxState extends State<MessageInputBox> {
  final Widget prefix;
  final Widget suffix;
  final bool roundedCorners;
  final Function onChanged;
  final Function onSubmitted;

  TextEditingController _textEditingController = TextEditingController();
  _MessageInputBoxState(
      {this.prefix,
      this.suffix,
      this.roundedCorners,
      this.onChanged,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    double cornerRadius() {
      if (roundedCorners != null && roundedCorners == true) {
        return 60.0;
      } else {
        return 0.0;
      }
    }

    double padding() {
      if (roundedCorners != null && roundedCorners == true) {
        return 12.0;
      } else {
        return 8.0;
      }
    }

    return Container(
      margin: EdgeInsets.all(5), // margin for
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(cornerRadius()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 20,
            blurRadius: 20,
            offset: Offset(0, -5), // changes position of shadow
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark.withOpacity(0.1),
          borderRadius: BorderRadius.circular(cornerRadius()),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: padding(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            prefix ??
                SizedBox(
                  width: 0,
                  height: 0,
                ),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                /* onSubmitted: onSubmitted,*/
                controller: _textEditingController,
                //autofocus: false,

                decoration: InputDecoration(
                  hintText: "Enter Message...",
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(
                    16.0,
                  ),
                ),
                style: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
            suffix ??
                SizedBox(
                  width: 0,
                  height: 0,
                ),
            sendButton(_textEditingController),
          ],
        ),
      ),
    );
  }
}

Future<void> sendPushMessage(String text) async {
  /*if (_token == null) {
    print('Unable to send FCM message, no token exists.');
    return;
  }*/

  try {
    var headers = {
      'Authorization':
          'key=AAAAosQp8hY:APA91bFo9QbwXADrzi5Brb5jLjJYSHjP-UT3Ti3e1vKSu77bLx0QIcELVWlpDQQjHY0A9d6yBycbs0Is1qgzNHS6ulsjhUEpDtkZbq7ruM3YL7mj29DKgq217O8GLhmoxbDqeQfeNyxI',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body =
        '''{\n    "to":"/topics/chatt_user",\n "notification" : {\n  "sound" : "default",\n  "body" :  "$text",\n  "title" : "eslam",\n  "content_available" : true,\n  "priority" : "high"\n },\n "data" : {\n  "sound" : "default",\n  "body" :  "$text",\n  "title" : ";mllp",\n  "sender_id":"1234",\n  "sender_name":"eslam",\n  "content_available" : true,\n  "priority" : "high"\n }\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
/*

      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'key=AAAAosQp8hY:APA91bFo9QbwXADrzi5Brb5jLjJYSHjP-UT3Ti3e1vKSu77bLx0QIcELVWlpDQQjHY0A9d6yBycbs0Is1qgzNHS6ulsjhUEpDtkZbq7ruM3YL7mj29DKgq217O8GLhmoxbDqeQfeNyxI'
        },
        body: constructFCMPayload(_token),
      );
*/
    print('FCM request for device sent!');
  } catch (e) {
    print(e);
  }
}

Widget sendButton(TextEditingController _textEditingController) {
  return ActionButton(
    onPressed: () {
      ClientChatScreen.chatMessages = [
        ...ClientChatScreen.chatMessages,
        ChatMessage(
          message: Padding(
            padding:
                const EdgeInsets.fromLTRB(10.0, 6, 10, 5), // padding for chatt
            child: Text(
              _textEditingController.value.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
          messageType: MessageType.sent,
          time: "2:00",
          sender: "user1",
        )
      ];
      /*chatList.messages.add(chatModel(
          RemoteMessage(data: {
            'body': _textEditingController.value.text,
            'sender_name': "chat_user_name"
          }),
          MessageType.sent));*/
      /* sendPushMessage(_textEditingController.value.text);*/
      _textEditingController.clear();
    },
    icon: Icon(
      Icons.send,
      size: 26.0,
      color: Colors.blue,
    ),
  );
}
