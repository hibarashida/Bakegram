import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'CartScreen.dart';
import 'Productimages.dart';

class ProductScreen extends StatelessWidget {
  String userid;
  bool show;
   ProductScreen({super.key,required this.show,required this.userid});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
          width: width *2.0,
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
        ),        actions: [
          Icon(Icons.favorite,color: twhite),SizedBox(width: 5,),
          InkWell(onTap: () {
            callNext(context,CartScreen(userId: userid,));
          },
              child: Icon(Icons.shopping_cart,color: twhite)),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return SizedBox(
                  // width: 50,
                  height: height,
                  child: GridView.builder(
                    // physics:  NeverScrollableScrollPhysics(),
                    itemCount:value.Productmodeldata.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .55,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 20.0),
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductImages(
                          photo: value.Productmodeldata[index].photo,
                          name:value.Productmodeldata[index].name,
                          decription: value.Productmodeldata[index].description,
                          ingredients:value.Productmodeldata[index].ingridient,
                          price:value.Productmodeldata[index].price,
                          discount:value.Productmodeldata[index].discount,
                          productid:value.Productmodeldata[index].Productid,
                          categoryId:value.Productmodeldata[index].categoryid,
                          userid: userid,
                          show: show,

                        ),));
                      },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          // height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black12)),
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

                              fonttxt(value.Productmodeldata[index].name,tbrown,12,FontWeight.w800),
                              Row(
                                children: [
                                  fonttxt("RS."+ value.Productmodeldata[index].price,tblack,12,FontWeight.w800),
                                fonttxt(value.Productmodeldata[index].discount,Colors.red,12,FontWeight.w800),
                                ],
                              ),
                              Container(
                               margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                               height: 25,
                               width: width,
                               decoration: BoxDecoration(color:twhite,border: Border.all(width: 2,color:lgrey),borderRadius: BorderRadius.circular(15)),
                                child:Center(
                                  child: Text("ORDER NOW",textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: tbrown,
                                        fontSize: 10,
                                        fontFamily: 'ink nut',
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),

                             )
                            ],
                          ),
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
