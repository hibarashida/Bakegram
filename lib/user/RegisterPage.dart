import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bmainColor2,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: twhite,
                radius: 60,
                backgroundImage: AssetImage("assets/personicon.png"),
              ),

            ),
            txtfdtext("Name",twhite),
            Center(child: rtTxtForm1(width/1.1,height/18)),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    txtfdtext("Gender",twhite),
                    Radio(
                        value: "male",activeColor: Colors.black,
                        groupValue: value.checkvalue,
                        onChanged: (valu) {
                          value.checkvalue = value.toString();
                          value.notifyListeners();
                        }),
                    gtxt("Male",twhite),
                    Radio(
                        value: " female",activeColor: Colors.black,
                        groupValue: value.checkvalue,
                        onChanged: (valu) {
                          value.checkvalue = value.toString();
                          value.notifyListeners();
                        }),
                    gtxt("Female",twhite),
                    Radio(
                        value: "other" ,activeColor: Colors.black,
                        groupValue: value.checkvalue,
                        onChanged: (valu) {
                          value.checkvalue = value.toString();
                          value.notifyListeners();
                        }),
                    gtxt("other",twhite),

                  ],
                );
              }
            ),
            txtfdtext("mobile number",twhite),
            // Center(child: phntTxtForm1(width/1.1, height/18)),

            txtfdtext("Address",twhite),

            Center(child: rtTxtForm1(width/1.1,height/18)),

            Padding(
              padding:  EdgeInsets.only(top: 100),
              child: Center(child: btn(twhite, "REGISTER", bmainColor2, width / 1.6, height / 15)),
            ),
            InkWell(onTap: (){
              back(context);

            },
                child: Text("already registered.....!",style: TextStyle(color: tbrown),))

          ],
        ),
      ) ,

    );
  }
}
