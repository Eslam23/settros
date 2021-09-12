import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/screens/homepage_screen.dart';
import 'package:service_system/theme/theme.dart';

import 'setting/setting_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;

  GlobalKey<_NavigationHomeScreenState> _bottomNavigationKey = GlobalKey();
  int _page = 0;
  @override
  void initState() {
    screenView =  HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.white,

      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
backgroundColor: Colors.white,
          body: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items: <Widget>[
              Icon(Icons.home_outlined, size: 30),
             // Icon(Icons.perm_identity_outlined, size: 30),
              Icon(Icons.history, size: 30),
              Icon(Icons.report_gmailerrorred, size: 30),
              Icon(Icons.settings_outlined, size: 30),
            ],
            color: Theme.of(context).cardColor,
            buttonBackgroundColor: Theme.of(context).cardColor,
            backgroundColor: AppTheme.appColor,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) {
              if(index==0)
                setState(() {
                  screenView = HomeScreen();
                });
              /*if(index==1)
                setState(() {
                  screenView = ClientHomePage();
                });*/
              if(index==1)
                setState(() {
                  //screenView = OfferScreen();
                });
              if(index==2)
                setState(() { // todo ozady apps screen
               //   screenView = OzadyAppScreen(); //todo similar apps
                });

              if(index==3)
                setState(() {
                  screenView = SettingScreen();
                });
              return true;
            },
          ),
        ),
      ),
    );
  }

  /*void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView =  HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }*/
}
