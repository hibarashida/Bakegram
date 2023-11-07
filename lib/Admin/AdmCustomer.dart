import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';

class CustomersInfo extends StatelessWidget {
  const CustomersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: lightpcolor,
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back,color: twhite,)),
        title: fonttxt("Customer",twhite,20,FontWeight.w700),
      ),
         body: SingleChildScrollView(

           child: Consumer<MainProvider>(builder: (context, val1, child) {
                 return val1.getCustomerLoader?Center(child: CircularProgressIndicator(color: bmainColor2,)):
                 ListView.builder(
           shrinkWrap: true,
             physics: const ScrollPhysics(),
              itemCount: val1.customerRegister.length,
            itemBuilder: (listContext, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Container(
                height: 110,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.8),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(0, 3),
                      blurRadius: 5.0, // soften the shadow
                      // spreadRadius: 2.0, //extend the shadow
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top:  17.0,bottom: 17),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.48,
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.4,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          val1.customerRegister[index].name,
                                          style:  TextStyle(
                                              fontSize: val1.customerRegister[index].name.length>=15?12:16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Montserrat"
                                          ),
                                        ),
                                        Text( val1.customerRegister[index].mobilenumber,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color: tblack),),

                                      ],
                                    ),
                                  ),
                                  // const SizedBox(width: 7),
                                ],
                              ),
                            ),


                            // Row(
                            //   children: [
                            //     InkWell(
                            //       onTap: () {
                            //         value.whatsappLaunch(
                            //             number: item.phone,
                            //             message: '');
                            //       },
                            //       child: Container(
                            //         width: 87,
                            //         height: 25,
                            //
                            //         decoration: BoxDecoration(
                            //             border: Border.all(
                            //                 color: Color(0xFF006BB3)),
                            //             borderRadius:
                            //             BorderRadius.circular(
                            //                 25)),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //           MainAxisAlignment
                            //               .spaceEvenly,
                            //           children: [
                            //             Image.asset(
                            //               "assets/whatsappnew.png",
                            //               scale: 1.8,
                            //             ),
                            //             const Text(
                            //               "Whatsapp",
                            //               style: TextStyle(
                            //                   fontSize: 9.0,
                            //                   fontWeight:
                            //                   FontWeight.bold,
                            //                   color: myblue1,
                            //                   fontFamily:
                            //                   "Montserrat"),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         value.makingPhoneCall(
                            //             item.phone);
                            //       },
                            //       child: Container(
                            //         width: 61,
                            //         height: 25,
                            //         decoration: BoxDecoration(
                            //             border: Border.all(
                            //               color: Color(0xFF006BB3),),
                            //             borderRadius:
                            //             BorderRadius.circular(
                            //                 15)),
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(horizontal: 7),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //             MainAxisAlignment
                            //                 .spaceEvenly,
                            //             children: [
                            //               Image.asset(
                            //                 "assets/callicon.png",
                            //                 scale: 2.5,
                            //               ),
                            //               const Text(
                            //                 "Call",
                            //                 style: TextStyle(
                            //                     fontSize: 9.0,
                            //                     fontWeight:
                            //                     FontWeight.bold,
                            //                     color: myblue1,
                            //                     fontFamily:
                            //                     "Montserrat"),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),


                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 14),
                        width: 72,
                        height: 90,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [bmainColor2, lightcolor, twhite],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: bmainColor2,width: 1)
                        ),
                        child: val1.customerRegister[index].photo!=""?ClipRRect(borderRadius: BorderRadius.circular(15),
                            child: Image.network( val1.customerRegister[index].photo.toString(),fit: BoxFit.fill,)):Image.asset("assets/nophoto.png",scale: 1.5) ,
                      ),
                    ],
                  ),
                ),
              ),
            );
        },
      );



  }  ),
         )
    );
  }
}
