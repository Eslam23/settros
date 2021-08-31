import 'package:flutter/material.dart';
import 'package:service_system/theme/theme.dart';

import '../online_image.dart';
//import 'package:hosting_app/app_theme.dart';
//import 'package:hosting_app/chat/shared_widgets/profile_image.dart';

class ChatItem extends StatelessWidget {
  final Widget profileImage;
  final String name;
  final String message;
  final String date;
  final String infoMsg;
  final Widget counter;
  final Color nameColor;
  final Color messageColor;
  final Color backgroundColor;
  final bool multiLineMessage;
  final Function onPressed;

  ChatItem({
    this.profileImage,
    this.name,
    this.message,
    this.date,
    this.infoMsg,
    this.counter,
    this.nameColor,
    this.messageColor,
    this.backgroundColor,
    this.multiLineMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        color: backgroundColor ?? Theme.of(context).primaryColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: multiLineMessage == true
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            profileImage ?? ProfileImage(),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 4.0,
                      top: multiLineMessage == true ? 8.0 : 0.0,
                    ),
                    child: Text(
                      name ?? "Name",
                      style: TextStyle(
                        fontSize: 16.0,
                        /* color: nameColor ?? Theme.of(context).primaryColorDark,*/
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message ?? "Start conversation",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: multiLineMessage == true ? 100 : 1,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: messageColor ??
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        message == null ? "" : date ?? "",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: multiLineMessage == true ? 100 : 1,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: messageColor ??
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            counter ?? Container(),
            infoMsg != null
                ? Icon(
                    Icons.info,
                    color: AppTheme.nearlyBlack,
                  )
                : SizedBox(),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
