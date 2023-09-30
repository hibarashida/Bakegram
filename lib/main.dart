import 'package:bakegram/provider/LoginProvider.dart';
import 'package:bakegram/provider/MainProvider.dart';
import 'package:bakegram/user/BottamNavigationBar.dart';
import 'package:bakegram/user/Productimages.dart';
import 'package:bakegram/user/ProfileScreen.dart';
import 'package:bakegram/user/RegisterPage.dart';
import 'package:bakegram/user/SplashScreen.dart';
import 'package:bakegram/user/UsrHomeScreen1.dart';
import 'package:bakegram/user/login%20page.dart';
import 'package:bakegram/user/otpverifyscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Admin/AdmHomescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        // home:  AdmHomeScrn(),

        // home:BottomNav (),
        // home:ProductImages (),
        // home:Otplogin (),
      ),
    );
  }
}
