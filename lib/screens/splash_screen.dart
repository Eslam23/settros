import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/screens/registration/login.dart';
import 'package:service_system/screens/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double moveTop = 1000;
  double moveBottom = 0;
  double moveRight = 0;
  double moveLeft = -500;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 4500), () async {
      setState(() {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height ;
    double width = MediaQuery.of(context).size.width;

    Future.delayed(
      Duration(seconds: 0),
      () async {
        setState(() {
          moveLeft = width * 0.15;
          moveRight = width * 0.15;
        });
      },
    );
    Future.delayed(
      Duration(milliseconds: 0),
      () async {
        setState(() {
          moveTop = 0;
          moveBottom = height*0.02;
        });
      },
    );
    return  Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              top: moveTop,
              bottom: moveBottom,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  "assets/images/icon-img.png",
                  fit: BoxFit.contain,
                  height: height * 0.1,
                  width: width * 0.4,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.45, //350,
                width:width, //400,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            AnimatedPositioned(
                duration: Duration(seconds: 2),
                //curve: Curves.easeInOutBack,
                right: moveRight,
                left: moveLeft,
                bottom: 0,
                top: height * 0.55, //350,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.05, //150,
                      width: width *0.4, //250,
                      child: Center(
                        child: Image.asset("assets/images/logo-name.png"),
                      ),
                    ),
                  ],
                )),
            // Center(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.of(context).pushReplacement(
            //             MaterialPageRoute(builder: (context) => HomePage()));
            //       },
            //       child: null),
            // )
          ],
        ),
    );
  }
}
