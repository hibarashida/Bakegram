import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';

class AddUser extends StatelessWidget {
   AddUser({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightwcolor,
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back,color: twhite,)),
        title: fonttxt("Add User",twhite,20,FontWeight.w300),
      ),

       body: SingleChildScrollView(
         child: Form(
           key: formKey,
           child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [

             txtfdtext("Name",tblack),
             Consumer<MainProvider>(
               builder: (context,value1,child) {
                 return Center(child: rtTxtForm1(width/1.1,height/18,1,value1.userNameController,''));
               }
             ),
             txtfdtext("Phone Number",tblack),
             Consumer<MainProvider>(
               builder: (context,value2,child) {
                 return Center(child: phntTxtForm1(width/1.1, height/18,twhite,1,value2.mobNoController,''));
               }
             ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     txtfdtext("User Type",tblack),

                     Consumer<MainProvider>(
                         builder: (context, value,child) {
                           return Container(
                             margin: EdgeInsets.symmetric(horizontal: 15),
                             width:width/1.1 ,
                             height:  height/18,
                             decoration: BoxDecoration(color:twhite ,borderRadius: BorderRadius.circular(20)),
                             child: DropdownButton(
                               // Initial Value
                               underline:Container(color: Colors.white) ,
                               value:value.dropdownvalue,
                               icon: const Icon(Icons.keyboard_arrow_down),
                               items:value.Type.map((String item) {
                                 return DropdownMenuItem(
                                   value: item,
                                   child: Text(item),
                                 );
                               }).toList(),
                               onChanged: (String? newValue) {
                                 value.dropdown(newValue!);
                               },
                             ),
                           );
                         }
                     ),
                   ],
                 ),
                 Center(child:

                 Consumer<MainProvider>(
                   builder: (context,value1,child) {
                     return InkWell(onTap: () {
                           final FormState? form = formKey.currentState;
                          if(form!.validate()) {
                            value1.addUsers("NEW", "", context);
                          }

                     },child: value1.adduserLoader?CircularProgressIndicator(color: bmainColor2,):
                     btn(bmainColor2, "Save", twhite, width / 3, height / 15,16,FontWeight.w600));
                   }
                 )),


               ]),
         ),
       ),

    );
  }
}
