import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'AdmCarousel.dart';
import 'Admcategory.dart';
import 'Ordersshowscreeen.dart';
import 'Requestshowscrren.dart';
import 'admProducts.dart';

class AdmHomeScrn extends StatelessWidget {
  const AdmHomeScrn({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: apColor,
      appBar: AppBar(
        backgroundColor: bmainColor2,
        actions: [Image.asset("assets/bakegramlogo.png",scale: 5,)],
      ),
      body: Column(
        children: [
          InkWell(onTap: () {
            callNext(context,RequestsScreen());
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

              height:  height / 15,
              width: width / 1.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                color: twhite,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Text("  REQUESTS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          InkWell(onTap: () {
            callNext(context,AdnOrderscreen());

          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

              height:  height / 15,
              width: width / 1.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                color: twhite,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Text("  ORDER LISTS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          Consumer<MainProvider>(builder: (context, value, child) {
            return    InkWell(onTap: () {
                value.getProductdata();
              callNext(context,AdmProduct());
            },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                height:  height / 15,
                width: width / 1.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                  color: twhite,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: Text("  Add product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            );
          },

          ),
          Consumer<MainProvider>(
            builder: (context, value1, child) {
              return InkWell(onTap: () {
                value1.getCategorydata();
                callNext(context,AdmCategory());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                  height:  height / 15,
                  width: width / 1.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                    color: twhite,
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text("  Add Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              );
            },

          ),
          Consumer<MainProvider>(builder: (context, value, child) {
            return    InkWell(onTap: () {

              callNext(context,AdmCarousel());
            },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                height:  height / 15,
                width: width / 1.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                  color: twhite,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: Text("  Add Carosuel imgs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            );
          },

          ),
        ],
      ),
    );
  }
}
