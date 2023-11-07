import 'package:bakegram/user/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';
import 'Productimages.dart';




class Category extends StatelessWidget {
  String userId;
   Category({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    MainProvider BakegramProvider=Provider.of<MainProvider>(context);
    BakegramProvider.getCategorydata();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lpink2,
      appBar:  AppBar(automaticallyImplyLeading: false,
        backgroundColor: apColor,
        title: Row(
          children: [
            Text("--------------",style: TextStyle(color: twhite)),
            fonttxt("CATEGORIES",tblack,18,FontWeight.w700 ,),
            SizedBox(width: 5,),
            Text("--------------",style: TextStyle(color: twhite)),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: height,
              width: width/3,
              color: maincontcolor,
              child:
              SizedBox(
                height: 110,
                child: Consumer<MainProvider>(builder:(context, value1, child) {
                  return ListView.builder(
                    itemCount:value1.Categorymodeldata.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {
                        value1.getproductadmindata(value1
                            .Categorymodeldata[index].Id
                            .toString());

                      },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  const CircleAvatar(
                                    radius: 31,
                                    backgroundColor: Colors.black12,
                                  ),
                                  Positioned(
                                    top: 1,
                                    left: 1,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                      NetworkImage(value1.Categorymodeldata[index].Image),
                                    ),
                                  ),
                                ],
                              ),
                              fonttxt(value1.Categorymodeldata[index].Name,twhite,15,FontWeight.w500 ),

                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                ),
              ),
            ),
            Container(
              height: height,
              width: width/1.5,
              color:lpink2,
              child: Consumer<MainProvider>(
                builder: (context, val, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: val.Productmodeldata.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .95,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0),
                    itemBuilder: (context, index) {
                      var items= val.Productmodeldata[index];
                      return InkWell(onTap: () {
                        val.tdpickerclear();
                        callNext(context, ProductImages(photo: items.photo,productid: items.Productid,userid: userId,
                          discount: items.discount,name: items.name,decription: items.description,ingredients: items.ingridient, categoryId: items.categoryid,
                          price: items.price,show: true,));

                      },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          height: 250,
                          child: Column(
                            children: [
                              Container(
                                height:94,
                                width: 150,
                                child: ClipRRect(borderRadius: BorderRadiusDirectional.circular(10),
                                  child: Image.network(
                                      val.Productmodeldata[index].photo,
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
