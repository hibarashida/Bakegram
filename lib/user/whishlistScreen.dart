import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';
import 'CartScreen.dart';
import 'Productimages.dart';

class WhishlistScreen extends StatelessWidget {
  String userid;


   WhishlistScreen({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: lightpcolor,
        appBar: AppBar(
          backgroundColor: apColor,

          leading: InkWell(
              onTap: () {
                back(context);
              },
              child:  Icon(Icons.arrow_back,color: twhite)),

          title: Container(
            width: width * 2.0,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(top: 4),
              ),
            ),
          ), actions: [
          InkWell(onTap: () {
            callNext(context, CartScreen(userId: userid,));
          },
              child: Icon(Icons.shopping_cart, color: twhite)),
        ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return SizedBox(
                      // width: 50,
                      height: height,
                      child: GridView.builder(
                        // physics:  NeverScrollableScrollPhysics(),
                        itemCount: value.Productmodeldata.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .60,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 20.0),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            // height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.black12)),
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.blue,
                                  height: 200,
                                  width: 190,
                                  child: Image.network(
                                    value.Productmodeldata[index].photo,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: 5),

                                fonttxt(value.Productmodeldata[index].name,
                                    tbrown, 12, FontWeight.w800),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        fonttxt("RS." +
                                            value.Productmodeldata[index].price,
                                            tblack, 12, FontWeight.w800),
                                        fonttxt(value.Productmodeldata[index]
                                            .discount, Colors.red, 12,
                                            FontWeight.w800),
                                      ],
                                    ),
                                    Icon(Icons.favorite_border,color: twhite,size: 25,),


                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
              ),
              SizedBox(height: 100,)
            ],

          ),
        )
    );
  }

}