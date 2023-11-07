import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'Orderlist.dart';

class AdnOrderscreen extends StatelessWidget {
  const AdnOrderscreen({super.key});

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
        title: fonttxt("Orders",twhite,20,FontWeight.w700),
        // actions: [
        //   Image.asset("assets/bakegramlogo.png",scale: 5,)],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(5),
            dashPattern: [5, 5],
            color:Colors.black38,
            strokeWidth: 1,
            child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(margin: EdgeInsets.only(left: 5,top: 5,bottom: 5),
                  width: 280,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: TextField(onTap: () {
                    },
                    decoration: InputDecoration(
                      hintText:" Search",
                      prefixIcon: const Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding:  EdgeInsets.only(top: 4),
                    ),
                  ),
                ),
                Icon(Icons.filter_list,color: tblack,size: 30,),
                Text("Filter",style: TextStyle(color: tblack,fontWeight: FontWeight.w400,fontSize: 18),)
              ],
            ),),
          InkWell(
            onTap: () {
              callNext(context,OrderList());

            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: height/5,
              width: width,
              decoration: BoxDecoration(color: bmainColor2,borderRadius:BorderRadius.circular(10) ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: twhite,borderRadius:BorderRadius.circular(10) ,
                        // image:DecorationImage(image: AssetImage(""))
                         ),
                  ),
                  Column(
                    children: [
                      Text("name"),
                      Text("data"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.orange,size: 15),
                              Icon(Icons.star,color: Colors.orange,size: 15),
                              Icon(Icons.star,color: Colors.orange,size: 15),
                              Icon(Icons.star,color: Colors.orange,size: 15),
                              Icon(Icons.star,color: Colors.orange,size: 15),
                            ],
                          ),
                          Container(
                            height: 10,width: 50,
                            decoration: BoxDecoration(color: twhite,borderRadius:BorderRadius.circular(10) ,
                            ),
                          child: Center(child: Text("Review",style: TextStyle(color: tblack,fontSize: 10))),),
                          Icon(Icons.arrow_forward_ios)

                    ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                        height: 15,
                        width: 150,
                        decoration: BoxDecoration(color: twhite,borderRadius:BorderRadius.circular(10) ,
                        ),
                        child: Center(child: Text("ghjkl",style: TextStyle(color: bmainColor2))),

                      ) ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
