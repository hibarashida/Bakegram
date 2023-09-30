import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';

 class UsrHomeScreen extends StatelessWidget {
  const UsrHomeScreen({super.key});

  @override
    Widget build(BuildContext context) {
    MainProvider BakegramProvider=Provider.of<MainProvider>(context);
    // BakegramProvider.getCategorydata();
    // BakegramProvider.getProductdata();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bmainColor,
      appBar: myAppbar(width),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,valu ,child) {
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
                           itemCount: 6,
                       itemBuilder: (context, index, realIndex) {
                                 final image = valu.Carosuelimg[index];
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                 child: Image.asset(valu.Carosuelimg[index],fit: BoxFit.fill
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
                          valu.activeIndex(index);
                       // print("activvgvg"+Activeindex.toString());

                                  }),
                       ),
                                     Positioned( top: 270,
                           left: 140,
                            child:buildIndiCator(valu.Carosuelimg.length,context,valu.Activeindex),
                         ),
                          ],
                      ),),

                fonttxt("choose type of sweet",tlightwhite,20,FontWeight.w300),
                SizedBox(
                  height: 110,
                  child: Consumer<MainProvider>(builder:(context, value1, child) {
                    return ListView.builder(
                      itemCount:value1.Categorymodeldata.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
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
                              fonttxt(value1.Categorymodeldata[index].Name,twhite,10,FontWeight.w500 ),
                            ],
                          ),
                        );
                      },
                    );
                  },

                  ),
                ),
                fonttxt("Our Best Sellers",tlightwhite,20,FontWeight.w500),
                Container(
                  height: 330,
                  color: maincontcolor,

                  child: Consumer<MainProvider>(builder: (context, val, child) {
                    return  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1/.78,
                          crossAxisSpacing: 14.0,
                          mainAxisSpacing: 10.0
                      ),
                      itemBuilder: ( context, index){
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          height: 400,

                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color:twhite,),borderRadius: BorderRadius.circular(10),),
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                width: 185,
                                child: Image.network(valu.Productmodeldata[index].photo,fit: BoxFit.fitWidth),
                              ),

                            ],
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
                    activeDotColor: Colors.grey, dotColor:Colors.white),
                   ),
                    ),
  );
 }



