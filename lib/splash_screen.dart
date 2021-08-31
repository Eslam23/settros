import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/login.dart';
import 'package:service_system/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double moveTop = 1000;
  double moveBottom = 0;
  double moveRight = 500;
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
    double h1 = MediaQuery.of(context).size.width / 10;
    double w1 = MediaQuery.of(context).size.width / 10;
    Future.delayed(
      Duration(seconds: 0),
      () async {
        setState(() {
          moveLeft = w1 * 1.5;
          moveRight = w1 * 1.5;
        });
      },
    );
    Future.delayed(
      Duration(milliseconds: 0),
      () async {
        setState(() {
          moveTop = 0;
          moveBottom = h1 * 3.3;
        });
      },
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 2500),
              top: moveTop,
              bottom: moveBottom,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  "assets/images/icon-img.png",
                  fit: BoxFit.contain,
                  height: h1 * 5.5,
                  width: w1 * 5.5,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: h1 * 9.6, //350,
                width: w1 * 10, //400,
                color: Colors.white,
              ),
            ),
            AnimatedPositioned(
                duration: Duration(seconds: 2),
                //curve: Curves.easeInOutBack,
                right: moveRight,
                left: moveLeft,
                bottom: 0,
                top: h1 * 9.6, //350,
                child: Column(
                  children: [
                    Container(
                      height: h1 * 4.6, //150,
                      width: w1 * 7, //250,
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
      ),
    );
  }
}
