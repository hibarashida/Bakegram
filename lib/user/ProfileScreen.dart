import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: lpink2,
      appBar: myAppbar(width),
     body:SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(height: 20,),
           Center(
             child: Container(
               height: 140,
               width: 140,
               decoration: BoxDecoration(shape: BoxShape.circle,color: twhite,boxShadow:[
                 BoxShadow(color: lgrey,blurRadius: 5,offset:  Offset(0,3)) ,
               ] ),
               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset("assets/profileicon.png",scale: 3,color: bmainColor2),
                   Text("Upload Photo",style: TextStyle(color: tbrown,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Montserrat"))
                 ],
               ),
             ),
           ),
           SizedBox(
             height: 10,
           ),
           menubtn("My Order ", width),
           menubtn("My Wishlist", width),
           menubtn("Payments", width),
           menubtn("Viewed Products", width,),
           menubtn("Notification", width),
           menubtn("Contact us", width),
           menubtn("Help center", width),
           menubtn("LOGOUT", width),
          ],
        ),
      ) ,
    );
  }
}
