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
        child:Icon(Icons.add,color: tblack) ,
        onPressed: () {
          bakegramprovider.getCategorydata();
          callNext(context,AddProduct(from:"" , oldId: '',));
          },
      ),
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back)),
         title: fonttxt("Products",twhite,20,FontWeight.w300),),
         body:Consumer<MainProvider>(builder: (context, value3, child) {
          return  ListView.builder(
            itemCount:value3.Productmodeldata.length,
            itemBuilder:(BuildContext context,int index){
              return   InkWell(onDoubleTap: () {

                   showDialog(
                  context: context,
               builder: (context) => AlertDialog(
               title: const Text("Alert !!!!" ),
               content: const Text(
                      "Do you want to  EDIT or DELETE ?"),
                    actions: <Widget>[
                    TextButton(
                      onPressed: () {
                     value3.deleteproduct(
                      value3.Productmodeldata[index].Productid);
                      Navigator.of(context).pop();
                     value3.getProductdata();
                         ScaffoldMessenger.of(context)
                        .showSnackBar(
                     const SnackBar(
                                 content: Text("Product deleted successfully ")),
                      );
                      },
                        child: Container(
                         padding: const EdgeInsets.all(14),
                       child: const Text("Delete"),
                        ),
                            ),
                        TextButton(
                              onPressed: () {
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
                             value3.editproduct(
                           value3.Productmodeldata[index].Productid);
                              },
                              child: Container(
                             child: Text("Edit"),
                            ))
                              ],
                       ),
                             );
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  height:height/3,
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
                          child: Image.network(value1.Productmodeldata[index].photo,fit: BoxFit.cover,),
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
            });
      }

      )
    );
  }
}
