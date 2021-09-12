import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:service_system/functions/glowRemoveScrollBehaviour.dart';
//import 'package:hosting_app/chat/functions/glowRemoveScrollBehaviour.dart';

enum ScrollType {
  fixedHeader,
  floatingHeader,
}

class PageWrapper extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;
  final Widget header;
  final ScrollType scrollType;
  final Widget footer;
  final bool reverseBodyList;

  PageWrapper(
      {this.children,
      this.backgroundColor,
      this.header,
      this.scrollType,
      this.footer,
      this.reverseBodyList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24.0,
      ),
      color: Colors.blue[100], //Theme.of(context).backgroundColor,
      child: _PageBodyWidget(
        scrollType: scrollType,
        children: children,
        header: header,
        footer: footer,
        reverseBodyList: reverseBodyList,
      ),
    );
  }
}

class _PageBodyWidget extends StatelessWidget {
  final List<Widget> children;
  final Widget header;
  final ScrollType scrollType;
  final Widget footer;
  final bool reverseBodyList;
  _PageBodyWidget(
      {this.children,
      this.header,
      this.scrollType,
      this.footer,
      this.reverseBodyList});

  @override
  Widget build(BuildContext context) {
    double inputPadding() {
      return 0;
    }

    double bottomPadding() {
      if (footer != null && scrollType == ScrollType.floatingHeader) {
        return 50;
      } else {
        return 12.0;
      }
    }

    if (scrollType != null && scrollType == ScrollType.floatingHeader) {
      return Stack(
        children: [
          Positioned(
            top: 160.0,
            left: 136,
            //behavior: GlowRemoveScrollBehaviour(),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                'friday 15/9/21',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            //reverse: reverseBodyList ?? false,
            //padding:
            //children: children,
          ),

          //),
          Positioned(
            child: ScrollConfiguration(
              behavior: GlowRemoveScrollBehaviour(),
              child: ListView(
                reverse: reverseBodyList ?? false,
                padding: EdgeInsets.only(
                  top: 210.0, // chat container text
                  bottom: bottomPadding(),
                ),
                children: children,
              ),
            ),
          ),
          Positioned(
            child: header ?? Container(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(inputPadding()),
              child: footer,
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          header ?? Container(),
          Expanded(
              child: ScrollConfiguration(
            behavior: GlowRemoveScrollBehaviour(),
            child: ListView(
              reverse: reverseBodyList ?? false,
              padding: EdgeInsets.all(0.0),
              children: children,
            ),
          )),
          footer ?? Container(),
        ],
      );
    }
  }
}
