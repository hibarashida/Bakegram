import 'package:bakegram/constant/callfunction.dart';
import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'delivaryaddress.dart';

class AddressList extends StatelessWidget {
  String userid;
   AddressList({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lpink2,
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: apColor,
        leading:InkWell(onTap: () {
          back(context);
        },
            child: Icon(Icons.arrow_back)),
        title: fonttxt("Delivary Address", tblack, 20, FontWeight.w600),
      ),
       body:  Column(
         children: [
           Consumer<MainProvider>(
               builder: (context,val,child) {
                 return Expanded(
                   child: ListView.builder(
                       shrinkWrap: true,

                       physics: const ScrollPhysics(),
                       itemCount:val.addressdetails.length,
                       itemBuilder: (context,index) {
                        var items=val.addressdetails[index];
                         return Container(
                           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                           width: width,
                           height: 150,
                           color: Colors.black38,
                           child: Column(
                             children: [
                               Container(
                                 // width: width,
                                 height: 140,
                                 // color: Colors.red,
                                 child: Row(children: [
                                   Radio(
                                     value:val.addressdetails[index].addressid,
                                     activeColor: Colors.green.shade500,
                                     groupValue: val.address123,
                                     onChanged: ( value) {
                                       val.address123=value.toString();
                                       // val.addressid=val.addressdetails[index].addressid;
                                       val.name = val.addressdetails[index].name;
                                       val.phonenumber = val.addressdetails[index].mobilenumber;
                                     val.whatsappnumber = val.addressdetails[index].whatsappnumber;
                                       val.naddress = val.addressdetails[index].address;
                                      val.pincode = val.addressdetails[index].pincode;
                                       val.choice = val.addressdetails[index].choice;
                                       val.destination = val.addressdetails[index].destination;
                                       val.notifyListeners();

                                       },
                                   ),
                                   // SizedBox(
                                   //   width: 50,
                                   // ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                          items.name,
                                           style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),

                                       Text(
                                           items.whatsappnumber,
                                           style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                       Text(
                                           items.mobilenumber,
                                           style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                       Row(
                                         children: [
                                           Text(
                                       items.choice,
                                               style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),

                                           Text(
                                              items.address,
                                               style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                           Text(
                                               items.destination,
                                               style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                         ],
                                       ),
                                       Text(
                                           items.pincode,
                                           style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                     ],
                                   ),
                                 ]),
                               ),
                             ],
                           ),
                         );
                       }
                   ),
                 );
               }
           ),
           InkWell(onTap: () {
             callNext(context, delivaryAdress(userid: userid,));
           },
               child: Center(child: btn(bmainColor2, "ADD NEW ADDRESS", tbrown, width / 1.6, height / 15,20,FontWeight.w800)))

         ],
       ),

    );
  }
}
