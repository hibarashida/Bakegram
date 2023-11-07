import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'ordersummaryScreen.dart';

class delivaryAdress extends StatelessWidget {
  String userid;
   delivaryAdress({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: apColor,

        title: fonttxt("Add Address", tblack, 20, FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            divider(1, 2, twhite),
            txtfdtext("Name",tblack),
            Consumer<MainProvider>(
              builder: (context,val1,child) {
                return addTxtForm1(width,height/18,1,val1.dnamecontroller);
              }
            ),
          txtfdtext("Mobile number",tblack),
            Consumer<MainProvider>(
              builder: (context,val2,child) {
                return addTxtForm2(width,height/18,1,val2.dphnnumbercontroller,10);
              }
            ),
            Row(
              children: [
                Consumer<MainProvider>(builder: (context, values, child) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Checkbox(
                        // shape: const CircleBorder(),
                        checkColor: Colors.white,
                        activeColor:  bmainColor2,
                        value: values.whatsapp,
                        onChanged: (value) {
                          values.radioButtonChanges(value!);
                        },
                      ),
                    ),
                  );
                }),
                Text("This is my whatsapp number",)
              ],
            ),
            txtfdtext("Whatsapp number",tblack),
            Consumer<MainProvider>(
              builder: (context,val3,child) {
                return addTxtForm2(width,height/18,1,val3.dwhastappnocontroller,10);
              }
            ),
            Consumer<MainProvider>(
                builder: (context,val2,child) {
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                              activeColor: bmainColor2,
                              value: "PICKUP ",
                              groupValue:val2.checkvalue2,
                              onChanged: (value){
                                val2.checkvalue2 = value.toString();
                                val2.notifyListeners();
                              }
                          ),
                          Container(
                              width:width / 4,
                              height:height / 18,
                              decoration: BoxDecoration( color: Colors.grey.shade200,borderRadius: BorderRadius.circular(18)),
                              child: Center(child:  Text(
                                "PICKUP",
                                style:
                                TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: tblack,fontFamily: "ink nut"),
                              ),))                     ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: bmainColor2,
                              value: "DELIVARY",
                              groupValue:val2.checkvalue2,
                              onChanged: (value){
                                val2.checkvalue2 = value.toString();
                                val2.notifyListeners();
                              }
                          ),
                          Container(
                              width:width / 3,
                              height:height / 18,
                              decoration: BoxDecoration( color: Colors.grey.shade200,borderRadius: BorderRadius.circular(18)),
                              child: Center(child:  Text(
                                "DELIVARY",
                                style:
                                TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: tblack,fontFamily: "ink nut"),
                              ),))                    ],
                      ),
                    ],);
                }
            ),
           txtfdtext("Address",tblack),
            Consumer<MainProvider>(
              builder: (context,val4,child) {
                return addTxtForm1(width,height/18,4,val4.dadresscontroller);
              }
            ),
            txtfdtext("PINCODE",tblack),
            Consumer<MainProvider>(
                builder: (context,val,child) {
                  return addTxtForm2(width,height/18,1,val.dpincodecontroller,6);
                }
            ),
              SizedBox(height: 5,),
              Consumer<MainProvider>(
                builder: (context,val3,child) {
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: bmainColor2,
                            value: "HOME ",
                            groupValue:val3.checkvalue1,
                            onChanged: (value){
                              val3.checkvalue1 = value.toString();
                              val3.notifyListeners();
                            }
                        ),
                        Container(
                            width:width / 4,
                            height:height / 18,
                            decoration: BoxDecoration( color: Colors.grey.shade200,borderRadius: BorderRadius.circular(18)),
                            child: Center(child:  Text(
                              "HOME",
                              style:
                              TextStyle(fontWeight: FontWeight.w300, fontSize: 17, color: tblack,fontFamily: "ink nut"),
                            ),))
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor: bmainColor2,
                            value: "WORK",
                            groupValue:val3.checkvalue1,
                            onChanged: (value){
                              val3.checkvalue1 = value.toString();
                              val3.notifyListeners();
                            }
                        ),
                        Container(
                            width:width / 4,
                            height:height / 18,
                            decoration: BoxDecoration( color: Colors.grey.shade200,borderRadius: BorderRadius.circular(18)),
                            child: Center(child:  Text(
                              "WORK",
                              style:
                              TextStyle(fontWeight: FontWeight.w300, fontSize: 17, color: tblack,fontFamily: "ink nut"),
                            ),))                    ],
                    ),
                  ],);
                }
              ),
            Consumer<MainProvider>(
              builder: (context,vlu,child) {
                return InkWell(onTap: () {
                  vlu.adddelivaryadrs(userid);
                 vlu.adresclear();
                 finish(context);
                 },
                    child: btn(bmainColor2,"SAVE",twhite, width,height/15,16,FontWeight.w600));
              }
            )
          ],
        ),
      ),
    );
  }
}

