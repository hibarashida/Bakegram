import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

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
        child: const Icon(Icons.arrow_back)),
        title:fonttxt("Chocoholic Cake",tbrown,20,FontWeight.w600),
        actions: [
          Icon(Icons.favorite,color: twhite),SizedBox(width: 5,),
          Icon(Icons.shopping_cart,color: twhite),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value1,child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: height/1.5,
                width: width,
                color: tlightwhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 290,
                      // color: Colors.black12,
                      child: Stack(
                        children: [

                          CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              final image = value1.Categoryimg2[index];
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  child: Image.asset(value1.Categoryimg2[index],fit: BoxFit.fill
                                    ,
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
                                  value1.activeIndex1(index);
                                  // print("activvgvg"+Activeindex.toString());

                                }),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 310,top: 10),
                            child: Icon(Icons.favorite_border),
                          ),
                          Positioned(
                            top: 270,
                            left: 140,
                            child:buildIndiCator(value1.Categoryimg2.length,context,value1.Activeindex1),
                          ),
                        ],
                      ),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        fonttxt("Chocoholic Cake",tbrown,20,FontWeight.w700),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.orange,size: 15,),
                            Icon(Icons.star,color: Colors.orange,size: 15),
                           Icon (Icons.star,color: Colors.orange,size: 15),
                            Icon(Icons.star,color: Colors.orange,size: 15),
                            Icon(Icons.star,color: Colors.orange,size: 15),
                          ],
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
                  Divider(
                    height: 1,
                    thickness: 2,
                    color: twhite,
                  ),

                  richtxt("Shape",tbrown,17,FontWeight.w800),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btn2(twhite, "Circle", bmainColor2, width / 3.9, height / 20),
                      btn2(twhite, "Square", bmainColor2, width / 3.9, height / 20),
                      btn2(twhite, "Heart", bmainColor2, width / 3.9, height / 20),
                    ],
                  ),richtxt("Layer",tbrown,17,FontWeight.w800),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 250),
                        height:  height / 20,
                        width: width / 3.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                          color: twhite,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown)),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      )
                    ],
                  ),
                  richtxt("Theme",tbrown,17,FontWeight.w800),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 250),

                        height:  height / 20,
                        width: width / 3.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                          color: twhite,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("color",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:tbrown)),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      )
                    ],
                  ),richtxt("Flavour",tbrown,17,FontWeight.w800),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btn2(twhite, "Vanile", bmainColor2, width / 3.9, height / 20),
                      btn2(twhite, "Chocolate", bmainColor2, width / 3.9, height / 20),
                      btn2(twhite, "red velvet", bmainColor2, width / 3.9, height / 20),
                    ],
                  ),
                  richtxt("Events",tbrown,17,FontWeight.w800),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btn2(twhite, "Birthday", bmainColor2, width / 4.90, height / 22),
                      btn2(twhite, "Anniversary", bmainColor2,width / 4.20, height / 22),
                      btn2(twhite, "Weddings", bmainColor2,width / 4.90, height / 22),
                      btn2(twhite, "other", bmainColor2, width / 4.90, height / 22),
                    ],
                  ),
                  richtxt("Weight",tbrown,17,FontWeight.w800),
            Container(
              width: width,
              color: Colors.red,
              height: height/20,
              child: Row(
                children: [
                 Container(
                   width: width/2,
                   height: 50,
                   color: twhite,
                   child: Center(child: Text("Add to cart",style: TextStyle(color: tblack,fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),)),
                 ),Container(
                   width: width/2,
                   height: 50,
                   color: cyellow,
                   child: Center(child: Text("Buy Now",style: TextStyle(color: tblack,fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),)),
                 ),
                ],
              ),
            ),


            ]);
          }
        ),

      ),


    );
  }
}
   buildIndiCator(int count, BuildContext context,int activeindex ) {
  //    print(activeIndex.toString()+"dpddoopf");
  return Center(
    child: Padding(
      padding:   const EdgeInsets.only(top: 6),
      child: AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: count,
        effect:  const JumpingDotEffect(dotWidth: 7, dotHeight: 7,
            strokeWidth: 1,paintStyle: PaintingStyle.stroke,
            activeDotColor: Colors.grey, dotColor:Colors.black),
      ),
    ),
  );
}
