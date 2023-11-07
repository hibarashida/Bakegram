import 'package:bakegram/provider/LoginProvider.dart';
import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';

class Otplogin extends StatelessWidget {
  const Otplogin({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bmainColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/bakegramlogo.png"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: height/3,
              width: width,
              decoration: BoxDecoration(color: ligthpink,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: apColor)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    child: fttxt("Enter your OTP", tblack, 15, FontWeight.w700),
                  ),
                  Consumer<LoginProvider>(
                    builder: (context,vale,child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:Pinput(
                          controller:vale.otpverifycontroller,
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          defaultPinTheme: PinTheme(
                              textStyle:
                               TextStyle(fontWeight: FontWeight.bold),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration( boxShadow: [
                                BoxShadow(
                                  color: twhite,
                                  blurRadius: 2.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                ),
                              ], borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1,
                                      color:bmainColor2.withOpacity(0.9)))),

                                  onCompleted: (pin){
                              vale.verify(context);

                              },
                        ),
                      );
                    }
                  ),
                  Center(child: btn(bmainColor2, "Verify", twhite, width / 3, height / 20,16,FontWeight.w600))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
