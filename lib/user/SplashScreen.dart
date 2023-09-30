

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
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
    Timer(const Duration(seconds: 3), () {
      MainProvider BakegramProvider=Provider.of<MainProvider>(context,listen: false);

      BakegramProvider.getCategorydata();
      BakegramProvider.getProductdata();

      callNextReplacement(context,BottomNav());
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => LoginPage(),
      //     ));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bmainColor,
      body: Center(child: Image.asset("assets/bakegramlogo.png")),

    );
  }
}
