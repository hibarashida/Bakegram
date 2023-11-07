import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../user/RegisterPage.dart';

class RequestsScreen extends StatelessWidget {
  String oldid;

   RequestsScreen({super.key,required this.oldid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold( backgroundColor: lightpcolor,
     appBar:AppBar(backgroundColor: bmainColor2,
     leading: InkWell(onTap:() {
       back(context);
     },
         child: Icon(Icons.arrow_back,color: twhite,)),
     title:fonttxt("Requests",twhite,20,FontWeight.w300) ,
     actions: [
       Image.asset("assets/bakegramlogo.png",scale: 5,)],),
      body:
        Consumer<MainProvider>(
          builder: (context,value,child) {
            return value.requestLoader?Center(child: CircularProgressIndicator(color: bmainColor2,)):ListView.builder(
              itemCount: value.customerRegister.length,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: (){
                      value.editrequestcutomer(value.customerRegister[index].Customerid);
                      callNext(context,RegisterPage(from:"Request", oldid:value.customerRegister[index].Customerid ,));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      height:height/10,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color: bmainColor2),
                        color: twhite,),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                           height: height,
                           width: width/5,
                           color:bmainColor2,
                           child: value.customerRegister[index].photo==''?CircleAvatar(radius:60,
                               backgroundColor: twhite ,
                               child:Image.asset("assets/profileicon.png",scale: 4,color: bmainColor2,fit: BoxFit.fill)): Image.network(value.customerRegister[index].photo,
                             scale: 4,fit: BoxFit.fill),
                         ),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value.customerRegister[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                              Text(value.customerRegister[index].mobilenumber,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },);
          }
        )


    );
  }
}
