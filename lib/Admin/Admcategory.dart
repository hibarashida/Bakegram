import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'AddCategory.dart';

class AdmCategory extends StatelessWidget {
  const AdmCategory({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider bakegramprovider = Provider.of<MainProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0x91FC1C1C),shape: CircleBorder(),
        child:Icon(Icons.add,color: twhite,size: 38) ,
        onPressed: () {
        bakegramprovider.CategoryClear();
          callNext(context,AddCategory(from: "NEW",OldId: '',));

        },),
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back,color: twhite,),),
        title: fonttxt("Category",twhite,20,FontWeight.w300),
      ),
      body: Column(
        children: [
          Consumer<MainProvider>(builder: (context, value, child) {
            print(value.loader.toString()+"ddkkd");
            return value.loader?Center(child:  CircularProgressIndicator(color: bmainColor2,)):
            Expanded(
              child: GridView.builder(
                  itemCount: value.Categorymodeldata.length,
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
                                      value.deletecategory(
                                          value.Categorymodeldata[index].Id,context);
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
                                        value.editcategory(
                                            value.Categorymodeldata[index].Id);
                                        finish(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddCategory(
                                                      from: "EDIT",
                                                      OldId: value
                                                          .Categorymodeldata[index].Id
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
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height: 450,
                        width: 80,
                        decoration: BoxDecoration(border: Border.all(width: 2,color: bmainColor2),color: bmainColor2,
                            borderRadius: BorderRadius.all(Radius.circular(5)),),
                        child:Column(
                          children: [
                            Container(
                              height:160,
                              width: width,
                              child:  value.Categorymodeldata[index].Image!=""?Image.network(value.Categorymodeldata[index].Image,fit: BoxFit.fill,)
                                  :Image.asset("assets/add.png",fit: BoxFit.fill),
                            ),
                            Text(
                              value.Categorymodeldata[index].Name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: twhite,
                                  fontSize: 15,
                                  fontFamily: 'ink nut',
                                  fontWeight: FontWeight.w300),
                            ),                          ],
                        )
                      ),


                    );

                  }),
            );
          },
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

}
