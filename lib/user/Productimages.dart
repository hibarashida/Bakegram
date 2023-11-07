import 'package:bakegram/user/whishlistScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';
import 'CartScreen.dart';
import 'ordersummaryScreen.dart';

class ProductImages extends StatelessWidget {
  String photo;
  String name;
  String productid;
  String decription;
  String ingredients;
  String price;
  String discount;
  String categoryId;
  String userid;
  bool show;
  ProductImages({super.key,
      required this.photo,
      required this.name,
      required this.productid,
      required this.price,
      required this.discount,
      required this.decription,
      required this.ingredients,
      required this.categoryId,
      required this.userid,
      required this.show});


  @override
  Widget build(BuildContext context) {
    MainProvider bakegramprovider = Provider.of<MainProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: lightcolor,
        appBar: AppBar(
          backgroundColor: apColor,
          leading: InkWell(
              onTap: () {
                back(context);
              },
              child:  Icon(Icons.arrow_back,color: twhite,)),
          title: fonttxt(name, tbrown, 20, FontWeight.w600),
          actions: [
            InkWell(
              onTap: () {
                callNext(context, WhishlistScreen(userid: userid,));
              },
                child: Icon(Icons.favorite, color: twhite)),
            SizedBox(
              width: 5,
            ),
            InkWell(onTap: () {
              callNext(context, CartScreen(userId: userid,));
            },
                child: Icon(Icons.shopping_cart, color: twhite)),
          ],
        ),
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(builder: (context, value1, child) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: height / 1.4,
                    width: width,
                    color: lightwcolor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          width: width,
                          child: Stack(
                            children: [
                              ClipRRect(
                                child: Center(
                                  child: Image.network(photo, fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 310, top: 10),
                                child: Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fonttxt(name, tbrown, 16, FontWeight.w700),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                Icon(Icons.star, color: Colors.orange, size: 15),
                              ],
                            ),
                          ],
                        ),
                        TabBar(
                          indicatorColor: boxcolor,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Text("DESCRIPTION",
                                  style: TextStyle(color: tblack, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text("INGREDIENTS ",
                                  style: TextStyle(color: tblack, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(children: [
                            SingleChildScrollView(
                            child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Text(decription,
                                  style: TextStyle(color: bmainColor2, fontSize: 13, fontWeight: FontWeight.w700))
                        ),
                          ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Text(ingredients,
                                    style: TextStyle(color: bmainColor2, fontSize: 15, fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ]  ),
                        ),
                        Row(
                          children: [
                            RichText(
                              text:  TextSpan(
                                text:"RS: ",
                                style: TextStyle(
                                    color: tblack,
                                    fontSize: 18,
                                    fontFamily: 'ink nut',
                                    fontWeight:FontWeight.w700),
                                children: <TextSpan>[
                                  TextSpan(text: price,
                                      style: TextStyle(fontWeight: FontWeight.w700, color: tbrown,fontSize: 16)),
                                ],
                              ),
                            ),
                            fonttxt(discount+"%", Colors.orangeAccent, 16, FontWeight.w700),


                          ],
                        )
                      ],
                    ),
                  ),
                  divider(1, 2, twhite),
                  Consumer<MainProvider>(
                    builder: (context,value1,child) {
                      return Visibility(
                        visible: categoryId=="1695193130603"?true:false,
                        child: Row(
                          children: [
                            richtxt("Shape", tbrown, 17, FontWeight.w800),
                            Padding(
                              padding:  EdgeInsets.only(right: 10,top: 5),
                              child: Text(value1.ShapesSelect, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: bmainColor2)),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,val1,child) {
                      return Visibility(
                        visible: categoryId=="1695193130603"?true:false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(onTap: () {
                              val1.shapeSelection("Circle");
                            },
                                child: btn2(twhite,"Circle", bmainColor2, width / 3.9, height / 20)),
                            InkWell(onTap: () {
                              val1.shapeSelection("Square");

                            },
                                child: btn2(twhite,"Square", bmainColor2, width / 3.9, height / 20)),
                            InkWell(onTap: () {
                              val1.shapeSelection("Heart");
                            },
                                child: btn2(twhite,"Heart", bmainColor2, width / 3.9, height / 20)),
                          ],
                        ),
                      );
                    }
                  ),
                  categoryId == "1695193130603"?
                  Consumer<MainProvider>(
                    builder: (context,val2,child) {
                      return Row(
                        children: [
                          richtxt("Layer", tbrown, 17, FontWeight.w800),
                          Padding(
                            padding:  EdgeInsets.only(right: 10,top: 5),
                            child: Text(val2. LayerSelect, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: bmainColor2)),
                          ),
                        ],
                      );
                    }
                  ):Consumer<MainProvider>(
                      builder: (context,val2,child) {
                        return Row(
                          children: [
                            richtxt("Piece", tbrown, 17, FontWeight.w800),
                            Padding(
                              padding:  EdgeInsets.only(right: 10,top: 5),
                              child: Text(val2. LayerSelect, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: bmainColor2)),
                            ),
                          ],
                        );
                      }
                  ),

                  Consumer<MainProvider>(
                      builder: (context, value,child) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: height / 20,
                          width: width / 3.9,
                        decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 2, color: bmainColor2),
                                color: twhite,
                              ),
                          child: DropdownButton(
                            // Initial Value
                            underline:Container(color: Colors.white) ,
                            value:value.dropdownval,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items:value.layer.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tbrown)),
                              );
                            }).toList(),
                            onChanged: (String? newVal) {
                              value.dropdown1(newVal!);
                              value.layerSelection(newVal);
                            },
                          ),
                        );
                      }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,vlu,child) {
                      return Visibility(
                        visible: categoryId=="1695193358046"?false:true,
                        child: Row(
                          children: [
                            richtxt("Theme", tbrown, 17, FontWeight.w800),
                            Padding(
                              padding:  EdgeInsets.only(right: 10,top: 5),
                              child: Text(vlu. themeSelect, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: bmainColor2)),
                            ),
                          ],
                        ),
                      );
                    }
                  ),

                  Consumer<MainProvider>(
                      builder: (context, value1,child) {
                        return Visibility(
                          visible: categoryId=="1695193358046"?false:true,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: height / 20,
                            width: width / 3.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: bmainColor2),
                              color: twhite,
                            ),
                            child: DropdownButton(
                              // Initial Value
                              underline:Container(color: Colors.white) ,
                              value:value1.dropdownvale,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items:value1.Color.map((String items1) {
                                return DropdownMenuItem(
                                  value: items1,
                                  child: Text(items1,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: tbrown)),
                                );
                              }).toList(),
                              onChanged: (String? newVal1) {
                                value1.dropdown2(newVal1!);
                                value1.themeSelection(newVal1);
                              },
                            ),
                          ),
                        );
                      }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value2,child) {
                      return Visibility(
                        visible: categoryId=="1695193358046"?false:true,
                        child: Row(
                          children: [
                            richtxt("Flavour", tbrown, 17, FontWeight.w800),
                            Padding(
                              padding: EdgeInsets.only(right: 10, top: 5),
                              child: Text(value2.FlavourSelect, style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: bmainColor2)),
                            ),
                          ],
                        ),
                      );
                    }),
                 Consumer<MainProvider>(
                    builder: (context,val2,child) {
                      return Visibility(
                        visible: categoryId=="1695193358046"?false:true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(onTap: () {
                              val2.flavourSelection("Vanile");
                            },
                                child: btn2(twhite, "Vanile", bmainColor2, width / 3.9, height / 20)),
                            InkWell(onTap: () {
                              val2.flavourSelection("Chocolate");
                            },child: btn2(twhite, "Chocolate", bmainColor2, width / 3.9, height / 20)),
                            InkWell(onTap: () {
                              val2.flavourSelection("red velvet");
                            },child: btn2(twhite, "red velvet", bmainColor2, width / 3.9, height / 20)),
                          ],
                        ),
                      );
                    }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value3,child) {
                      return Visibility(
                        visible: categoryId=="1695193358046"?false:true,
                        child: Row(
                          children: [
                            richtxt("Events", tbrown, 17, FontWeight.w800),
                            Padding(
                              padding:  EdgeInsets.only(right: 10,top: 5),
                              child: Text(value3.EventsSelect, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: bmainColor2)),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,val3,child) {
                      return Visibility(
                        visible: categoryId=="1695193358046"?false:true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(onTap: () {
                              val3.EventsSelection("Birthday");
                            },child: btn2(twhite,"Birthday", bmainColor2, width / 4.90, height / 22)),
                            InkWell(onTap: () {
                              val3.EventsSelection("Anniversary");
                            },child: btn2(twhite,"Anniversary", bmainColor2, width / 4.20, height / 22)),
                            InkWell(onTap: () {
                              val3.EventsSelection("Weddings");
                            },child: btn2(twhite,"Weddings", bmainColor2, width / 4.90, height / 22)),
                            InkWell(onTap: () {
                              val3.EventsSelection("other");
                            },child: btn2(twhite,"other",bmainColor2, width / 4.90, height / 22)),
                          ],
                        ),
                      );
                    }
                  ),
                  Visibility( visible: categoryId=="1695193130603"?true:false,
                      child: richtxt("Weight", tbrown, 17, FontWeight.w800)),
                  Visibility(
                    visible: categoryId=="1695193130603"?true:false,
                    child: Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return Column(
                          children: [
                            Text(
                              "Kg: " + val.kgValue
                                  .toString(),
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: bmainColor2)
                            ),

                            Slider(
                              activeColor: boxcolor,
                              label: "Select kg",
                              value: val.KG.toDouble(),
                              onChanged: (value) {
                                val.changeValue(value.toInt());
                                },
                              min:0,
                              divisions: 20,
                              max: 15,
                            ),

                          ],
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 10,),
                  divider(1, 2, twhite),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    height:height/6 ,
                    width: width,
                    decoration: BoxDecoration(color: twhite,borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                            children: [

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            child: Image.asset("assets/DELIVARY.png",scale: 2,),
                          ),
                          // SizedBox(width: 5,),
                          Text("DELIVARY AVAILBLE",style: TextStyle(color: tgreen,fontWeight: FontWeight.bold,fontSize: 13)),
                          Container(margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            height: 15,width: 2,color: tblack,),
                          Text("Cash on delivery Avaliable",style: TextStyle(color: tblack,fontWeight: FontWeight.bold,fontSize: 13))
                        ]),
                      Column( mainAxisAlignment: MainAxisAlignment.spaceAround,


                        children: [
                          Consumer<MainProvider>(
                              builder: (context,value2,child) {
                              return InkWell(onTap: () {
                                value2.selectDate(context);
                              },
                                child: Row(
                                  children: [
                                    Text("DATE :",style: TextStyle(color: bmainColor2, fontSize: 20, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 5,),
                                   value2.dateController.text==''? Text("__/__/__",style: TextStyle(color: tblack, fontSize: 20, fontWeight: FontWeight.bold),):
                                   Text(value2.dateController.text.toString(),style: TextStyle(color: tblack, fontSize: 20, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              );
                            }
                          ),
                          Consumer<MainProvider>(
                              builder: (context,value3,child) {
                              return InkWell(onTap: () {
                                value3.selectTime(context);
                              },
                                child: Row(
                                  children: [
                                    Text("TIME :",style: TextStyle(color: bmainColor2, fontSize: 20, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 5,),
                                    value3.timeController.text==''? Text("00:00",style: TextStyle(color: tblack, fontSize: 20, fontWeight: FontWeight.bold),):
                                    Text(value3.timeController.text.toString(),style: TextStyle(color: tblack, fontSize: 20, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              );
                            }
                          ),
                        ],
                      )
                      ],
                    ),
                  ),

                  Consumer<MainProvider>(
                    builder: (context,value1,child) {
                      return InkWell(onTap: () {
                        value1.AddCartdetails(name, productid, price, discount, ingredients, context, photo);
                      },
                        child: Container(
                          // margin: EdgeInsets.symmetric(horizontal: 150),

                          width: width,
                          // color: Colors.red,
                          height: height / 12,
                          child: Row(
                            children: [
                              Container(
                                width: width / 2,
                                height: 58,
                                color: twhite,
                                child: Center(
                                    child: Text(
                                  "Add to cart",
                                  style: TextStyle(color: tblack,fontWeight: FontWeight.bold, fontSize: 20),
                                )),
                              ),
                              InkWell(onTap: () {
                                value1.getdelivaryadrs(userid);
                                callNext(context, OrderSummaryscrn(userid: userid,));
                              },
                                child: Container(
                                  width: width / 2,
                                  height: 58,
                                  color: cyellow,
                                  child: Center(
                                      child: Text("Buy Now",
                                    style: TextStyle(color: tblack, fontWeight: FontWeight.bold, fontSize: 20),
                                  )
                                  ),
                                ),
                              ),
                            ]),
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 5,)
                ]);
          }),
        ),
      ),
    );
  }
}
