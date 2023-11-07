import 'package:bakegram/user/whishlistScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';
import 'login page.dart';
import 'myOrderScreen.dart';

class ProfileScreen extends StatelessWidget {
  String userId,name,phn,photo;

   ProfileScreen({super.key,required this.userId,required this.name,required this.phn,required this.photo,});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    MainProvider bakegramProvider =Provider.of<MainProvider>(context);
    return Scaffold(
      backgroundColor: lpink2,
      appBar: myAppbar(width,bakegramProvider.searchProduct),
     body:SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(height: 20,),
           Center(
             child: Column(
               children: [
                 Container(
                   height: 140,
                   width: 140,
                   decoration: BoxDecoration(shape: BoxShape.circle,color: twhite,
                       boxShadow:[
                     BoxShadow(color: lgrey,blurRadius: 5,offset:  Offset(0,3)) ,
                   ],
                       image: DecorationImage(image: NetworkImage(photo),) ),
                 ),
                 Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: tblack, fontFamily: 'ink nut',)),
                 Text(phn,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400)),
               ],
             ),
           ),
           SizedBox(
             height: 10,
           ),
           InkWell(onTap: () {
             callNext(context, MyOrderScreen());

           },child: menubtn("My Order ", width)),
           InkWell(onTap: () {
             callNext(context, WhishlistScreen( userid: userId,));
           },
               child: menubtn("My Wishlist", width)),
           menubtn("Viewed Products", width,),
           menubtn("Notification", width),
           InkWell(onTap: () {

           },
               child: menubtn("About Us", width)),
           InkWell(onTap: () {
             _showBottomSheet(context);
           },
               child: menubtn("Contact us", width)),
           menubtn("Help center", width),
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
                             bakegramProvider.selectedIndex=0;
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
                  );},
               child: menubtn("LOGOUT", width)),
          ],
        ),
      ) ,
    );
  }
}

void _showBottomSheet(BuildContext context,) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

  MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 150,
          width: width,

          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Bottom sheet title
              Center(
                child: Text(
                  'Contact us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
               SizedBox(
                 height: 30,
               ),
              Consumer<MainProvider>(
                builder: (context,value1,child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      InkWell(
                        onTap: () {
                          value1.whatsappLaunch(number: "7994523981", message: "hai", );

                        },
                        child: Container(
                          width: width/2,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 3.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(0, 1)
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(
                                  15)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/whatsappicon.png",
                                scale: 5,
                              ),
                               Text(
                                "Whatsapp",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w700,
                                    color: tblack,
                                    fontFamily:
                                    "Montserrat"),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          value1.makingPhoneCall("+917994523981");
                        },
                        child: Container(
                          width: width/3,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 3.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(0, 1)
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(
                                  15)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/callicon.png",
                                scale: 5,
                              ),
                               Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w700,
                                    color: tblack,
                                    fontFamily:
                                    "Montserrat"),
                              )
                            ],
                          ),
                        ),
                      ),


                    ],
                  );
                }
              ),
            ],
          ),
        ),
      );
    },
  );
}
