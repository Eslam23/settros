import 'package:flutter/material.dart';
import 'package:service_system/Animation/FadeAnimation.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class VerfiyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: FadeAnimation(
                          1.6,
                          Container(
                            margin: EdgeInsets.only(top: 35),
                            child: Center(
                              child: Text(
                                "Enter Verfication Code",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinEntryTextField(
                      showFieldAsBox: true,
                      onSubmit: (String pin) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Pin"),
                                content: Text('Pin entered is $pin'),
                              );
                            }); //end showDialog()
                      }, // end onSubmit
                    ), // end PinEntryTextField()
                  ), // end Padding()
                ),
              ),
              Text(
                "Continue",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
      //appBar: AppBar(
        //title: Text("Enter Verification Code "),
      //),
      /*
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PinEntryTextField(
              showFieldAsBox: true,
              onSubmit: (String pin) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Pin"),
                        content: Text('Pin entered is $pin'),
                      );
                    }); //end showDialog()
              }, // end onSubmit
            ), // end PinEntryTextField()
          ), // end Padding()
        ),
      ),
    );
    */
 