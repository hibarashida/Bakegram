import 'package:bakegram/provider/MainProvider.dart';
import 'package:bakegram/user/whishlistScreen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'CartScreen.dart';
import 'delivaryaddress.dart';

class OrderSummaryscrn extends StatelessWidget {
  String userid;
   OrderSummaryscrn({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightcolor,
      appBar: AppBar(
        backgroundColor: apColor,
        leading: InkWell(
            onTap: () {
              back(context);
            },
            child:  Icon(Icons.arrow_back,color: twhite)),
        title: fonttxt("Order Summary", tblack, 20, FontWeight.w600),

      ),
      body: Column(
        children: [
          divider(1, 2, twhite),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height:height/4,
            width: width,
            decoration: BoxDecoration(color: twhite,borderRadius: BorderRadius.circular(15),border:Border.all(color: bmainColor2,
                width: 1) ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price Details",style: TextStyle(color: tblack,fontWeight: FontWeight.w600,fontSize: 15)),
                Column(
                  children: [
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("price",style: TextStyle(color: tblack,fontWeight: FontWeight.w500,fontSize: 15)),
                            Text("(items length)",style:
                            TextStyle(color: tblack,fontWeight: FontWeight.w400,fontSize: 13)),
                          ],
                        )
                        ,Text("12365",style:
                        TextStyle(color: tblack,fontWeight: FontWeight.w400,fontSize: 13)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("other"),
                        Text("50"),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Discount"),
                        Text("-30"),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivary",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: tblack)),
                        Text("pickup"),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: SizedBox(
                    height:height/25,
                    width: width,
                    child: DottedBorder(

                      borderType: BorderType.RRect,
                      radius: Radius.circular(5),
                      dashPattern: [5, 5],
                      color: tblack,
                      strokeWidth: 1,
                      child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Amount",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: tblack)),
                          Text("12365"),
                        ],
                      ),),
                  ),
                ),


              ],
            ),

          ),




          // Consumer<MainProvider>(
          //   builder: (context,value,child) {
          //     return value.addressBool? InkWell(onTap: () {
          //       callNext(context, delivaryAdress(userid: userid,));
          //     },
          //       child: Container(
          //         margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          //         width: width/5,
          //         height:height /15,
          //         color: bmainColor2,
          //         child: Center(child: Text("Add Adress",style: TextStyle(color: tblack,fontWeight: FontWeight.bold,fontSize: 15)),
          //       ),
          //     )):Container(
          //       margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //       width: width,
          //       height: height/8,
          //       decoration: BoxDecoration(color:  Color(0xFFF7E7EB),
          //       border:  Border.all( color: bmainColor2,width: 2)),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //
          //           InkWell(onTap: () {
          //
          //             callNext(context, delivaryAdress(userid: userid,));
          //           },
          //             child: Container(
          //               margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          //               width: width/5,
          //               height:height /15,
          //               color: bmainColor2,
          //               child: Center(child: Text("change",style: TextStyle(color: twhite,fontWeight: FontWeight.bold,fontSize: 15)),
          //             ),
          //           )
          //     )],
          //       ),
          //
          //     );
          //   }
          // ),

        ],
      ),

    );
  }
}
