import 'package:bakegram/constant/callfunction.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';
import 'AddressList.dart';
import 'Productimages.dart';
import 'delivaryaddress.dart';

class CartScreen  extends StatelessWidget {
  String userId;
   CartScreen ({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    MainProvider bakegramProvider=Provider.of<MainProvider>(context);
    return Scaffold( backgroundColor: lpink2,
      appBar: myAppbar(width,bakegramProvider.searchProduct),

      body:SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fonttxt("My Cart",tblack,20,FontWeight.w600),
            Container(

              margin: const EdgeInsets.only(left: 10),
              width: 90,
              height: 2,
              color: tblack,
            ),

            SizedBox(
              height:height/2,
              child: Consumer<MainProvider>(
                builder: (context,value1,child) {
                  return ListView.builder(itemCount: value1.cartprdtdetails.length,
                      itemBuilder: (context, index) {
                        var items= value1.cartprdtdetails[index];
                        return InkWell(onTap: () {
                          callNext(context, ProductImages(productid: items.productid,name: items.name,
                          price: items.price.toString(),categoryId:  items.categoryid,userid: userId,
                          show: true,discount: items.discount.toString(),photo: items.photo,decription: items.discription,
                            ingredients: items.ingredients,  ));
                        },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                           height:height /4,
                           width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: maincontcolor,
                            ),child: Row(children: [
                              Container(
                                height: height,
                                width: width/4,
                                decoration: BoxDecoration(color: maincontcolor,
                                    borderRadius:BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14) ) ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    child: Image.network(items.photo,fit: BoxFit.fill,),
                                  ),
                              ),
                             SizedBox(width: 10,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                fttxt(items.name, tbrown, items.name.length>=12?14:15, FontWeight.w700),
                                SizedBox(
                                  width:width*0.6 ,
                                    child: fttxt(items.ingredients, tbrown, items.name.length>=12?8:16, FontWeight.w700)),
                                Row(
                                  children: [
                                    Icon(Icons.star,size:15,color: twhite,),
                                    Icon(Icons.star,size:15,color: twhite),
                                    Icon(Icons.star,size:15,color: twhite),
                                    Icon(Icons.star,size:15,color: twhite),
                                    Icon(Icons.star,color: Colors.black12,size:18,),
                                    Row(
                                      children: [
                                        Text(items.flavour,style: TextStyle(color: tbrown,fontSize: 16,fontWeight: FontWeight.w700)),
                                              Text("(KG ${items.weight})",style: TextStyle(color: twhite,fontSize: 15),)
                                      ],
                                    )
                                  ]),
                                Container(

                                  width:  width / 4,
                                  height: height / 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: twhite),
                                     child: Center(
                                       child: Row(
                                         children: [
                                           Text(" RS:${items.price.toString()} ", style: TextStyle(color: tbrown,fontSize: 16,fontWeight: FontWeight.w700)),
                                           // Text("${items.discount}%",style: TextStyle(color: Colors.amber,fontSize: 16,fontWeight: FontWeight.w700) ),
                                         ],
                                       ),
                                     ),
                                ),
                                Row(
                                  children: [
                                    Consumer<MainProvider>(
                                        builder: (context,value,child) {
                                          return Container(
                                            // margin: EdgeInsets.only(right: 100,top: 10,left: 10),
                                            height: 20,
                                            width: 90,

                                            decoration: BoxDecoration(color: Colors.white
                                                ,borderRadius: BorderRadius.circular(10),
                                                border: Border.all(width: 1,color: Colors.black12,
                                                )
                                            ),
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(onTap: () {
                                                  value.Decrement(items.count,items.cartid,items.price);
                                                },
                                                  child: Container(
                                                    width: 25,
                                                    height: 40,
                                                    decoration: BoxDecoration(color: Colors.grey.shade300,
                                                        borderRadius:BorderRadius.only(bottomLeft: Radius.circular(10),
                                                            topLeft:Radius.circular(10) ) ),
                                                    child: Center(child: Text("-",style: TextStyle(fontWeight: FontWeight.bold))),
                                                  ),
                                                ),
                                                Center(child: Text(items.count.toString())),
                                                InkWell(
                                                  onTap: () {
                                                    print(items.price.toString()+"difiof");
                                                    value.Inrement(items.count,items.cartid,items.price);
                                                  },
                                                  child: Container(
                                                    // margin: EdgeInsets.only(left: 19),
                                                    width: 25,
                                                    height: 40,
                                                    decoration: BoxDecoration(color: Colors.grey.shade300,
                                                        borderRadius:BorderRadius.only(bottomRight: Radius.circular(10),
                                                            topRight:Radius.circular(10) ) ),
                                                    child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.bold),)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          );
                                        }
                                    ),
                                    SizedBox(width: 50,),
                                    InkWell(onTap: () {
                                         value1.deletecart(value1.cartprdtdetails[index].cartid.toString());
                                         value1.getcartdetails();
                                    },
                                      child: Container(
                                        height: 25,
                                        width: 70,
                                        color: twhite,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete_outline,
                                              color: tblack,
                                              size: 18,
                                            ),
                                            fttxt("remove", tblack, 10, FontWeight.w700),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                RichText(
                                  text:  TextSpan(
                                    text: "Delivery by on ",
                                    style: TextStyle(
                                        color: twhite,
                                        fontSize:10,
                                        fontFamily: 'ink nut',
                                        fontWeight: FontWeight.w700),
                                    children: <TextSpan>[
                                      TextSpan(text:items.date,),
                                      TextSpan(text:"|",),

                                      TextSpan(text: items.time,
                                          style: TextStyle(fontWeight: FontWeight.w700, color: twhite,fontSize: 10)),
                                    ],
                                  ),
                                )],
                            )
                          ]),
                          ),
                        );
                      },);
                }
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height:height/4,
              width: width,
              decoration: BoxDecoration(color: twhite,borderRadius: BorderRadius.circular(15),border:Border.all(color: bmainColor2,
                  width: 1) ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
             Consumer<MainProvider>(
               builder: (context,value,child) {
                 return InkWell(onTap: () {
                   value.getdelivaryadrs(userId);

                   callNext(context, AddressList(userid:userId,));
                 },
                   child: Container(
                     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     height: 100,
                     width: width,
                     decoration: BoxDecoration(color: twhite,border:  Border.all(color: bmainColor2,width: 1 ),
                     borderRadius: BorderRadius.circular(10)),
                     child:
                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           children: [
                             Text(value.name),
                             Text(value.whatsappnumber),
                             Text(value.naddress),
                             Text(value.choice),
                             Text(value.destination),
                             Text(value.pincode),
                           ],
                         ),

                         Container(
                           height: 50,
                           width: 100,
                           color:Colors.red,
                         )
                       ],
                     ),
                   ),
                 );
               }
             ),
            Center(child: btn(bmainColor2, "BUY ALL", tbrown, width / 1.6, height / 15,20,FontWeight.w800))



          ],
        ),
      ) ,

    );
  }
}
