import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:service_system/screens/registration/widget/customBtn.dart';
import 'package:service_system/theme/theme.dart';
import 'package:service_system/widget/custom_textfield.dart';

class Step3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Install Widget",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,),
        SizedBox(height: 10,),
        Text("To install C Box you can place this code before the body tag on every page of your website",textAlign: TextAlign.center,),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Text(
            text,
          ),
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            Clipboard.setData(ClipboardData(text: text));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.black54,
              // todo translate
              content: Text("copied to clipboard")),
            );
          },
          child: Container(
              width: MediaQuery.of(context).size.width/4,
              // todo translate
              child: CustomBtn("copy", icon(Icons.copy), AppTheme.appColor)),
        ),
        SizedBox(height: 10,),
        Text("You may also send these instructions to your developer",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(height: 10,),
        CustomTextField(
          icon: Icons.email,
          //todo translate
          hint: "Enter Your Developer's Email here.",
        ),
      ],
    );}}



    String text ="""<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.js"></script>

<script type="text/javascript">
    (function () {
    var s1 = document.createElement("script"),
    s0 = document.getElementsByTagName("script")[1];
    s1.async = true;
    s1.src = 'https://c-box.live/en/site/jiuT29ewuAHBHgf';
    s1.charset = 'UTF-8';
    s0.parentNode.insertBefore(s1, s0);
    })();
</script>
""";