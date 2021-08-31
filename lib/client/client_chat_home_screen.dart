import 'package:flutter/material.dart';
import 'package:service_system/shared_widgets/action_btn.dart';
import 'package:service_system/shared_widgets/chat_item.dart';
import 'package:service_system/shared_widgets/counter.dart';
import 'package:service_system/shared_widgets/page_header.dart';
import 'package:service_system/shared_widgets/page_wrapper.dart';
import 'package:service_system/shared_widgets/section_header.dart';

import '../online_image.dart';
import 'client_chat_screen.dart';

class ClientChatHomeScreen extends StatefulWidget {
  static final String id = "ClientChatHomeScreen";

  @override
  _ClientChatHomeScreenState createState() => _ClientChatHomeScreenState();
}

class _ClientChatHomeScreenState extends State<ClientChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWrapper(
        scrollType: ScrollType.floatingHeader,
        header: PageHeader(
          textSize: 22,
          prefixWidget: ActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: "Chat",
          /*suffixWidget: SizedBox(width: 50,)*/
        ),
        children: [
          /*SectionHeader(
            title: "Recent Moments",
          ),
          Container(
            height: 76.0,
            margin: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                */ /*Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: FlatAddStoryBtn(),
                ),*/ /*
                ProfileImage(
                  imageUrl: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
                  onlineIndicator: true,
                  outlineIndicator: true,
                ),
                ProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: true,
                  imageUrl: "https://images.unsplash.com/photo-1502323777036-f29e3972d82f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                ),
                ProfileImage(
                  outlineIndicator: true,
                  imageUrl: "https://images.unsplash.com/photo-1582721244958-d0cc82a417da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2179&q=80",
                ),
                ProfileImage(
                  onlineIndicator: true,
                  outlineIndicator: true,
                  imageUrl: "https://images.unsplash.com/photo-1583243567239-3727551e0c59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1112&q=80",
                ),
                ProfileImage(
                  outlineIndicator: true,
                ),
                ProfileImage(
                  outlineIndicator: true,
                ),
                ProfileImage(
                  outlineIndicator: true,
                )
              ],
            ),
          ),*/
          /*SectionHeader(
            title: "Marked Important",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ChatPage.id);
            },
            name: "Akshaye JH",
            profileImage: ProfileImage(
              imageUrl: "https://cdn.dribbble.com/users/1281912/avatars/normal/febecc326c76154551f9d4bbab73f97b.jpg?1468927304",
              onlineIndicator: true,
            ),
            message: "Hello World!, Welcome to Flat Social - Flutter UI Kit.",
            multiLineMessage: true,
            counter: Counter(
              text: "1",
            ),
          ),*/
          SectionHeader(
            title: "Chats",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
              /*Get.to(()=> ClientChatScreen(), binding: HomeBinding(),);*/
              /*return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: MyApp.themeMode,
                theme: Theme.of(context),
                fallbackLocale:  Locale(
                  'en',
                ),
                locale: Locale(
                  MyApp.localeLan.languageCode,
                ),
               */ /* getPages: AppPages.pages,
                initialRoute: AppPages.initial,*/ /*
                initialBinding: HomeBinding(),
                home: ClientChatScreen(),
                enableLog: true,
              );*/
            },
            profileImage: ProfileImage(
              outlineIndicator: true,
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
            ),
            message: "Test message",
            date: "24/3/2021",
            name: "Friend1",
            counter: Counter(
              color: Colors.red,
              text: "2",
            ),
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1536057222397-e51989d3cb8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80",
            ),
            name: "And His Brother",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1558392204-ac78741f4abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
            ),
            name: "And Sister",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1521235042493-c5bef89dc2c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1385&q=80",
            ),
            name: "Father",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1235&q=80",
            ),
            name: "Mother",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
            ),
            name: "Not From Family",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1573488693582-260a6f1a51c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1356&q=80",
            ),
            name: "Friend1",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1536057222397-e51989d3cb8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=639&q=80",
            ),
            name: "And His Brother",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1558392204-ac78741f4abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
            ),
            name: "And Sister",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1521235042493-c5bef89dc2c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1385&q=80",
            ),
            name: "Father",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1235&q=80",
            ),
            name: "Mother",
          ),
          ChatItem(
            onPressed: () {
              Navigator.pushNamed(context, ClientChatScreen.id);
            },
            profileImage: ProfileImage(
              onlineIndicator: true,
              imageUrl:
                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
            ),
            name: "Not From Family",
          )
        ],
      ),
    );
  }
}
