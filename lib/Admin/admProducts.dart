import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'AddProduct.dart';

class AdmProduct extends StatelessWidget {
  const AdmProduct({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider bakegramprovider = Provider.of<MainProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        floatingActionButton: FloatingActionButton(backgroundColor: Color(0x91FC1C1C),shape: CircleBorder(),
        child:Icon(Icons.add,color: twhite,size: 30,) ,
        onPressed: () {
          bakegramprovider.getCategorydata();
          bakegramprovider.Clearprdct();
          callNext(context,AddProduct(from:"NEW", oldId: '',));
          },
      ),
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back,color: twhite,)),
         title: fonttxt("Products",twhite,20,FontWeight.w300),),
         body:Consumer<MainProvider>(builder: (context, value3, child) {
          return value3.prdgetloader?Center(child: CircularProgressIndicator(color: bmainColor2,)):ListView.builder(
            itemCount:value3.Productmodeldata.length,
            itemBuilder:(BuildContext context,int index){
              return   InkWell(onTap: () {
                showDialog(
                  context: context,
               builder: (context) => AlertDialog(
               content:  Text(
                      "Do you want to EDIT/DELETE ?",style: TextStyle(
                   fontSize:17,
                   fontWeight: FontWeight.w600,
                   color: tblack)),
                    actions: <Widget>[
                    Center(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                           value3.deleteproduct(
                            value3.Productmodeldata[index].Productid,context);
                            Navigator.of(context).pop();
                            },
                              child:  Container(
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
                              value3.editproduct(
                                  value3.Productmodeldata[index].Productid);
                              finish(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddProduct(
                                            from: "EDIT",
                                            oldId: value3
                                                .Productmodeldata[index]
                                                .Productid),
                                  ));
                            },
                            child: Container(
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
                            ),
                          )
                        ],
                      ),
                    ),
                    ],
                       ),
                   );
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  height:height/2,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: bmainColor2),borderRadius: BorderRadius.circular(10),
                      color: maincontcolor
                  ),
                  child: Row(
                    children: [
                      Consumer<MainProvider>(builder:(context, value1, child) {
                        return  Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          height: 190,
                          width: 120,
                          color: twhite,
                          child: value1.Productmodeldata[index].photo!=""?
                          Image.network(value1.Productmodeldata[index].photo,fit: BoxFit.cover,):Image.asset("assets/add.png",fit: BoxFit.fill),
                        );
                      },),
                      SizedBox(
                        width: 20,
                      ),
                      Consumer<MainProvider>(builder: (context, value2, child) {
                        return SizedBox(
                          width: width/2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(value2.Productmodeldata[index].name,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:tbrown ,
                                    fontSize: 20,
                                    fontFamily: 'ink nut',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(value2.Productmodeldata[index].description,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:lghtwcolor ,
                                    fontSize: 10,
                                    fontFamily: 'ink nut',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(value2.Productmodeldata[index].ingridient,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:twhite ,
                                    fontSize: 10,
                                    fontFamily: 'ink nut',
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(value2.Productmodeldata[index].discount,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: cyellow)),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: twhite,
                                    ),

                                    child: Center(child: Text("RS"+value2.Productmodeldata[index].price)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        );
                      },
                      ),
                    ],
                  ),),
              );
            });}
         )
    );
  }
}
