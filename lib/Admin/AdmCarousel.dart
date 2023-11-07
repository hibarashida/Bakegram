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
    MainProvider bakegramprovider = Provider.of<MainProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0x91FC1C1C),shape: CircleBorder(),
        child:Icon(Icons.add,color: tblack) ,
        onPressed: () {
        bakegramprovider.Clearcarousel();
        callNext(context,AddCarousel(from: "NEW",oldId: "",));

        },),
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back,color: twhite,)),
        title: fonttxt("Carousel",twhite,20,FontWeight.w300),
      ),
      body: Column(
        children: [
          Consumer<MainProvider>(builder: (context, value, child) {
            print("fg22222hjk");
            return  value.getcarouselloader?Center(child: CircularProgressIndicator(color: bmainColor2,))
                :Expanded(
                 child:GridView.builder(
                  itemCount: value.carouselimg.length,
                  physics: ScrollPhysics(),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8
                  ),
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content:  Text(
                              "Do you want to  EDIT or DELETE ?",style: TextStyle(
                              fontSize:17,
                              fontWeight: FontWeight.w600,
                              color: tblack)),
                          actions: <Widget>[
                            Center(
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      value.deleteCarousel(
                                          value.carouselimg[index].Id,context);
                                      Navigator.of(context).pop();

                                    },
                                    child: Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.red ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Delete",style: TextStyle( color:twhite,fontSize: 17,fontWeight: FontWeight.w700))),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      value.editCarousel(
                                          value.carouselimg[index].Id);
                                      finish(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddCarousel(
                                                    from: "EDIT",
                                                    oldId: value.carouselimg[index].Id
                                                ),
                                          ));
                                    },
                                    child:Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:bmainColor2 ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Edit",style: TextStyle( color:twhite,fontSize: 17,fontWeight: FontWeight.w700))),
                                    ),)
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),),
                        child: value.carouselimg[index].Photo!=""?Image.network(value.carouselimg[index].Photo,fit: BoxFit.fill,):Image.asset("assets/add.png",fit: BoxFit.fill),
                      ),


                    );

                  })
            );
          },

          ),
        ],
      ),
    );
  }
}
