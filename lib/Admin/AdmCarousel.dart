import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';
import 'AddCarousel.dart';

class AdmCarousel extends StatelessWidget {
  const AdmCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0x91FC1C1C),shape: CircleBorder(),
        child:Icon(Icons.add,color: tblack) ,
        onPressed: () {
          callNext(context,AddCarousel());

        },),
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back)),
        title: fonttxt("Carousel",twhite,20,FontWeight.w300),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MainProvider>(builder: (context, value, child) {
              return SizedBox(
                height:height ,
                child: GridView.builder(
                    itemCount: 2,
                    physics: ScrollPhysics(),
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          // color: Colors.red,
                          // image: DecorationImage(
                          //     image: NetworkImage(value.Categorymodeldata[index].Image),
                          //     fit: BoxFit.cover),),
                        ) );
                    }),
              );
            },

            ),
          ],
        ),
      ),
    );
  }
}
