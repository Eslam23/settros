import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:service_system/shared_widgets/chat_message.dart';

class chatModel {
  final RemoteMessage message;
  MessageType messageType;
  chatModel(this.message, this.messageType);
}

class chatList {
  static String senderID;
  static String senderName;
  static List<chatModel> messages = [];
}
