

import 'dart:async';

import 'package:bakegram/Admin/AdmHomescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../provider/LoginProvider.dart';
import '../provider/MainProvider.dart';
import 'BottamNavigationBar.dart';
import 'login page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() {

      Timer? _timer;
      final FirebaseFirestore db = FirebaseFirestore.instance;
      String type= '';

      FirebaseAuth auth = FirebaseAuth.instance;
      var loginUser = auth.currentUser;

      super.initState();

      LoginProvider loginProvider =
      Provider.of<LoginProvider>(context, listen: false);
      MainProvider mainProvider =
      Provider.of<MainProvider>(context, listen: false);


      // mainProvider.lockApp();
      mainProvider.getCarouselimg();

      print(loginUser?.phoneNumber.toString());

      Timer(const Duration(seconds: 3), () {
        if (loginUser == null) {

          callNextReplacement(context, LoginPage());
        }
        else {
          loginProvider.userAuthorized(loginUser.phoneNumber, context);
        }

        // mainProvider.fetchDetails();
        // db.collection("USERS").where("MOBILE_NUMBER",isEqualTo:"${LoginUser?.phoneNumber}").get().then((value){
        //   if(value.docs.isNotEmpty) {
        //     print("tproporeporop");
        //     for(var e in value.docs){
        //       type= e.get("TYPE").toString();
        //       print(type+"fghjk");
        //       if(type=="USER"){
        //         if (LoginUser == null) {
        //           callNextReplacement(context, LoginPage());
        //         }
        //
        //         else {
        //
        //           callNextReplacement(context, BottomNav());
        //           // loginProvider.userAuthorized(LoginUser.phoneNumber, context);
        //         }
        //       }
        //       if(type== "ADMIN"){
        //
        //         if (LoginUser == null) {
        //           callNextReplacement(context, LoginPage());
        //         }
        //
        //         else {
        //           callNextReplacement(context, AdmHomeScrn());
        //           // loginProvider.userAuthorized(LoginUser.phoneNumber, context);
        //         }
        //       }
        //       else if(type=="USER"){
        //         if (LoginUser == null) {
        //           callNextReplacement(context, LoginPage());
        //         }
        //
        //         else {
        //
        //           callNextReplacement(context, BottomNav());
        //           // loginProvider.userAuthorized(LoginUser.phoneNumber, context);
        //         }
        //       }else{
        //         callNextReplacement(context, LoginPage());
        //       }
        //
        //
        //     }
        //   }else{
        //     callNextReplacement(context, LoginPage());
        //   }
        // });

      });

  }
  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: bmainColor,
      body: Center(child: Image.asset("assets/bakegramlogo.png")),

    );
  }
}
