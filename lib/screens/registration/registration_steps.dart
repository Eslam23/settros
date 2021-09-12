import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/screens/registration/steps/step1.dart';
import 'package:service_system/screens/registration/steps/step2.dart';
import 'package:service_system/screens/registration/steps/step3.dart';
import 'package:service_system/screens/registration/steps/step4.dart';
import 'package:service_system/theme/theme.dart';
import 'package:steps_indicator/steps_indicator.dart';

class RegistrationSteps extends StatefulWidget {
  @override
  _RegistrationStepsView createState() => _RegistrationStepsView();
}

class _RegistrationStepsView extends State<RegistrationSteps> {
  int selectedStep = 0;
  int nbSteps = 4;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: statusBarHeight * 1.5),
              child: Image.asset(
                "assets/images/app_logo.png",
                width: width * 0.3,
                height: height * 0.18,
              ),
            ),
            //todo translate this text
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Welcome to your dashboard," +
                    "\n"
                        "let's get you setup in 4 easy steps.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: statusBarHeight * 0.4),
              child: StepsIndicator(
                selectedStep: selectedStep,
                nbSteps: nbSteps,
                doneLineColor: AppTheme.appColor,
                doneStepColor: AppTheme.appColor,
                undoneLineColor: AppTheme.unselectedColor,
                isHorizontal: true,
                lineLength: width * 0.18,
                doneStepWidget: GestureDetector(
                  onTap: () {
                    if (selectedStep > 0) {
                      setState(() {
                        selectedStep--;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: width * 0.04,
                    backgroundColor: AppTheme.appColor,
                  ),
                ), // Custom Widget
                unselectedStepWidget: GestureDetector(
                  onTap: () {
                    if (selectedStep < nbSteps) {
                      setState(() {
                        selectedStep++;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: width * 0.04,
                    backgroundColor: AppTheme.unselectedColor,
                  ),
                ), // Custom Widget
                selectedStepWidget: CircleAvatar(
                  radius: width * 0.04,
                  backgroundColor: AppTheme.appColor,
                  child: Text(
                    ((selectedStep + 1).toString()),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                      /*color: Color(004399) */
                    ),
                  ),
                ), // Custom Widget
                /*lineLengthCustomStep: [
                          StepsIndicatorCustomLine(nbStep: 3, length: 80)
                        ],*/
                enableLineAnimation: true,
                enableStepAnimation: true,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: height*0.45
              ),
                /*decoration: BoxDecoration(
                    // color: Colors.white
                    ),*/
                alignment: Alignment.center,
                /*height: height*0.35,*/
                margin: EdgeInsets.all(20),
                child: selectedStep == 0
                    ? Step1()
                    : selectedStep == 1
                        ? Step2()
                        : selectedStep == 2
                            ? Step3()
                            : Step4()),
            //AirExporterContact(),
            //index1 ?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (selectedStep > 0) {
                        setState(() {
                          selectedStep--;
                        });
                      }
                    },
                    child: Text(
                      // todo translate
                      "previous",
                      style: TextStyle(
                        fontSize: width * 0.01 + 15,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.appColor,
                        /*color: Color(004399) */
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selectedStep < nbSteps) {
                        setState(() {
                          selectedStep++;
                        });
                      }
                    },
                    child: Text(
                      // todo translate
                      "next",
                      style: TextStyle(
                        fontSize: width * 0.01 + 15,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.appColor,
                        /*color: Color(004399) */
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
