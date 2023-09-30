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
       backgroundColor: twhite,
      appBar: AppBar(
        backgroundColor: apColor,
        title: Center(child: Image.asset(""
            "assets/BAKEGRAMtxt.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: height/1.7,
              width: width,
              decoration: BoxDecoration(color: ligthpink,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: apColor)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  Verification Code :",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: boxcolor)),
                  Text("  we have sent the verification code to",
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  Row(
                    children: [
                      const Text("  +91***********",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("  Change phone number?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color:boxcolor)),
                      ),
                    ],
                  ),
                  Text(" Enter Your OTP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
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
                              const TextStyle(fontWeight: FontWeight.bold),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:tbrown.withOpacity(0.9)))),
                        ),
                      );
                    }
                  ),
                  Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: () {
                            value.verify(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          height: 40,
                          width: width,
                          decoration: BoxDecoration(
                              color:apColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Center(
                                child: Text("Verify",
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold)),
                              )),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
