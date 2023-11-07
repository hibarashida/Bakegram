import 'dart:async';

import 'package:bakegram/user/products.dart';
import 'package:bakegram/user/searchScreen.dart';
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
import 'Productimages.dart';

class UsrHomeScreen extends StatelessWidget {
  String userId;
   UsrHomeScreen({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    MainProvider BakegramProvider = Provider.of<MainProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:lightcolor,
    appBar:     AppBar(
          backgroundColor: apColor,
          title: Container(
            width: width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: TextField(onTap: () {
              BakegramProvider.getProductdata();
              BakegramProvider.productSearchController.clear();

              callNext(context,SearchScreen(userid: userId,));
            },
              decoration: InputDecoration(
                hintText:" Search for sweets",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(top: 4),
              ),
            ),
          ),
          actions: [
            InkWell(onTap: () {
              callNext(context, WhishlistScreen(userid: userId,));
            },
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.favorite, color: twhite),
              ),
            )
          ],
        ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(builder: (context, valu, child) {
          return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 290,
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: valu.carouselimg.length,
                        itemBuilder: (context, index, realIndex) {
                          final items = valu.carouselimg[index];
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              child: Image.network(
                                items.Photo,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 270,
                            viewportFraction: 1,
                            autoPlay: true,
                            pageSnapping: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 4),
                            onPageChanged: (index, reason) {
                              valu.activeIndex(index);
                              // print("activvgvg"+Activeindex.toString());
                            }),
                      ),
                      Positioned(
                        top: 270,
                        left: 140,
                        child: buildIndiCator(
                            valu.carouselimg.length, context, valu.Activeindex),
                      ),
                    ],
                  ),
                ),
                fonttxt(
                    "choose type of sweet", tbrown, 20, FontWeight.w300),
                SizedBox(
                  height: 110,
                  child: Consumer<MainProvider>(
                    builder: (context, value1, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value1.Categorymodeldata.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              value1.getproductadmindata(value1
                                  .Categorymodeldata[index].Id
                                  .toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen( userid: userId,
                                      show:
                                          value1.Categorymodeldata[index].Id ==
                                                  "1695193130603"
                                              ? true
                                              : false,
                                    ),
                                  ));
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
                                          backgroundImage: NetworkImage(value1
                                              .Categorymodeldata[index].Image),
                                        ),
                                      ),
                                    ],
                                  ),
                                  fonttxt(value1.Categorymodeldata[index].Name,
                                      twhite, 10, FontWeight.w500),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                fonttxt("Our Best Sellers", tbrown, 20, FontWeight.w500),
                Container(
                  height: 390,
                  color: maincontcolor,
                  child: Consumer<MainProvider>(
                    builder: (context, val, child) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: val.topsellerdata.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / .90,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 10.0),
                        itemBuilder: (context, index) {
                          var items= val.topsellerdata[index];
                          return InkWell(
                            onTap: () {
                             callNext(context, ProductImages(photo: items.photo,productid: items.Productid,categoryId: items.categoryid,
                             discount: items.discount,name: items.name,decription: items.description,ingredients: items.ingridient, userid: userId,
                             price: items.price,show: true,));
                            },
                            child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal:5),
                              height: 300,
                              width: 150,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage( val.topsellerdata[index].photo,))
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 30,),
                                child: Text(val.topsellerdata[index].name,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'ink nut',
                                    fontSize: items.name.length>=15?10:10
                                    ,color: tblack),),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]);
        }),
      ),
    );
  }
}

buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 6),
      child: AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: count,
        effect: const JumpingDotEffect(
            dotWidth: 7,
            dotHeight: 7,
            strokeWidth: 1,
            paintStyle: PaintingStyle.stroke,
            activeDotColor: Colors.grey,
            dotColor: Colors.white),
      ),
    ),
  );
}
