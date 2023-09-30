import 'package:bakegram/constant/widgets.dart';
import 'package:bakegram/provider/LoginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import 'RegisterPage.dart';
import 'otpverifyscreen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: bmainColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(child: Image.asset("assets/bakegramlogo.png", scale: 2)),
            Text("Welcome...!",
                style: TextStyle(
                    color: twhite, fontWeight: FontWeight.w400, fontSize: 25)),
            Text("LOGIN and CONTINUE",
                style: TextStyle(
                    color: twhite, fontWeight: FontWeight.w300, fontSize: 12)),
            Consumer<LoginProvider>(
              builder: (context,value,child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: TextField(
                    controller: value.Loginphnnumber,
                    style: TextStyle(
                        color: twhite,
                        decorationColor: twhite,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone, color: twhite),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: twhite, width: 3)),
                      hintText: " Name ", hintStyle: TextStyle(color: twhite),
                      // border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(top: 4),
                    ),
                  ),
                );
              }
            ),
            Consumer<LoginProvider>(
              builder: (context,valu3,child) {
                return InkWell(onTap: (){
                  valu3.sendotp(context);

                  callNext(context,Otplogin());

                },
                    child: btn(twhite, "LOGIN HERE", bmainColor2, width / 1.6, height / 15));
              }
            ),
            InkWell(onTap: () {
              callNext(context,RegisterPage());
            },
                child:
                btn(twhite, "CREATE", bmainColor2, width / 1.6, height / 15)),
          ],
        ),
      ),
    );
  }
}
