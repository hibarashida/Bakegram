import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../user/RegisterPage.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold( backgroundColor: lightpcolor,
     appBar:AppBar(backgroundColor: bmainColor2,
     leading: InkWell(onTap:() {
       back(context);
     },
         child: Icon(Icons.arrow_back)),
     title:fonttxt("Requests",twhite,20,FontWeight.w300) ,
     actions: [
       Image.asset("assets/bakegramlogo.png",scale: 5,)],),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),

        height:height/7,
        width: width,
        decoration: BoxDecoration(
         border: Border.all(width: 2,color: bmainColor2),
          color: twhite,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("name"),
                Text("gender"),
                Text("phn no"),
                Text("address"),
              ],
            ),
            InkWell(onTap: () {

              callNext(context,RegisterPage());

            },
                child: Icon(Icons.arrow_forward_ios))
          ],
        ),



      ),

    );
  }
}
