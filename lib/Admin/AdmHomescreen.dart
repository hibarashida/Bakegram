import 'dart:io';

import 'package:bakegram/provider/MainProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../user/login page.dart';
import 'AdmCarousel.dart';
import 'AdmCustomer.dart';
import 'Admcategory.dart';
import 'Ordersshowscreeen.dart';
import 'Requestshowscrren.dart';
import 'adduser.dart';
import 'admProducts.dart';

class AdmHomeScrn extends StatelessWidget {
  const AdmHomeScrn({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(onWillPop: () async{
      showExitPopup(context);
        return true;
    },
      child: Scaffold(
        backgroundColor: apColor,
        appBar: AppBar(
          leading:Image.asset("assets/bakegramlogo.png",scale: 5,) ,
          backgroundColor: bmainColor2,
          actions:[
            InkWell(onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: twhite,
                  elevation: 20,
                  content:  Text(
                      "Do you want to Logout ?",style: TextStyle(
                      fontSize:17,

                      fontFamily:'ink nut',
                      fontWeight: FontWeight.w700,
                      color: bmainColor)),
                  actions: <Widget>[
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.signOut();
                            callNextReplacement(context, LoginPage());
                          },
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                                color:twhite ,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                  ),
                                ] ),
                            child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              finish(context);
                            },
                            child: Container(
                              height: 45,
                              width: 90,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: bmainColor2,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                  ),
                                ],
                              ),
                              child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                            ))
                      ],
                    )

                  ],
                ),
              );
            },
                child: Icon(Icons.logout_outlined,color: twhite,size:30,))]
        ),
        body: Column(
          children: [
            Consumer<MainProvider>(
              builder: (context,value1,child) {
                return InkWell(onTap: () {
                  value1.getRequestCustomers();
                  callNext(context,RequestsScreen(oldid: "",));
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
                );
              }
            ),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return InkWell(onTap: () {
                  val.getCustomerInfo();
                  callNext(context,CustomersInfo());

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
                        Center(child: Text("  CUSTOMERS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                );
              }
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
                value.getCarouselimg();
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
            Consumer<MainProvider>(
              builder: (context,value3,child) {
                return InkWell(onTap: () {
                  value3.adduserclear();
                  callNext(context,AddUser());

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
                        Center(child: Text("  Add new user",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown))),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
  Future<bool> showExitPopup(BuildContext CONTXT) async {
    return await showDialog(
        context: CONTXT,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: twhite,
            content: SizedBox(
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                            "Do you want to EXIT ?",style: TextStyle(
                            fontSize:17,

                            fontFamily:'ink nut',
                            fontWeight: FontWeight.w700,
                            color: bmainColor)),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: bmainColor2),
                            child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700)))
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ), child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),

                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}


