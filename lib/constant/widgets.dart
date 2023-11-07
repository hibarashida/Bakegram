
import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'callfunction.dart';
import 'myColors.dart';


 Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
  return Padding(
    padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: myColor,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: fonsize, fontWeight:fntw, color: textmycolor),
      )),
    ),
  );
}
 Widget btn2(Color myColor, String text, Color textmycolor, double width, double height) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
      color: myColor,
    ),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w900, color: textmycolor),
    )),
  );
}

  Widget menubtn(String text, double width) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    height: 39,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: twhite,
    ),
    child: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: tblack),
              ),
            ),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 15,
        )
      ],
    )),
  );
}

 Widget maincontainer(Color textmycolor, double width, double height) {
  return

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: twhite,
              border: Border.all(width: 2, color: bmainColor2)),
        ),

        // Row(
        //
        //   children: [
        //     Consumer<MainProvider>(
        //         builder: (context,value,child) {
        //           return Container(
        //             // margin: EdgeInsets.only(right: 100,top: 10,left: 10),
        //             height: 30,
        //             width: 110,
        //
        //             decoration: BoxDecoration(color: Colors.white
        //                 ,borderRadius: BorderRadius.circular(10),
        //                 border: Border.all(width: 1,color: Colors.black12,
        //                 )
        //             ),
        //             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 InkWell(onTap: () {
        //                   value.Decrement();
        //                 },
        //                   child: Container(
        //                     width: 30,
        //                     height: 40,
        //                     decoration: BoxDecoration(color: Colors.grey.shade300,
        //                         borderRadius:BorderRadius.only(bottomLeft: Radius.circular(10),
        //                             topLeft:Radius.circular(10) ) ),
        //                     child: Center(child: Text("-",style: TextStyle(fontWeight: FontWeight.bold))),
        //                   ),
        //                 ),
        //                 Center(child: Text(value.count.toString())),
        //                 InkWell(
        //                   onTap: () {
        //                     value.Inrement();
        //                   },
        //                   child: Container(
        //                     // margin: EdgeInsets.only(left: 19),
        //                     width: 30,
        //                     height: 40,
        //                     decoration: BoxDecoration(color: Colors.grey.shade300,
        //                         borderRadius:BorderRadius.only(bottomRight: Radius.circular(10),
        //                             topRight:Radius.circular(10) ) ),
        //                     child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.bold),)),
        //                   ),
        //                 ),
        //
        //               ],
        //             ),
        //           );
        //         }
        //     ),
        //     Container(
        //       height: 19,
        //       width: 70,
        //       color: twhite,
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.delete_sharp,
        //             size: 15,
        //           ),
        //           Text("remove")
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ],
    );
}


 PreferredSizeWidget myAppbar(double width,Function fun) {
  return AppBar(
    backgroundColor: apColor,
    title: Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextField(
        onChanged:(value) {
          fun(value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(top: 4),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.favorite, color: twhite),
      )
    ],
  );
}

  Widget rtTxtForm1(double width, double height,int maxline,TextEditingController controllers,String type) {
  return Container(
    width: width,
    // height: height,
    // color: Colors.red,
    child: TextFormField(

      controller: controllers,
      enabled:type=="Request"?false:true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        hintMaxLines: maxline,
        filled: true,
        fillColor: twhite,
        isDense: true,
        labelStyle: const TextStyle(fontSize: 15),
          focusedBorder:border,
          enabledBorder: border,
          errorBorder: border,
          border:border

      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is Required";
        } else {

        }
      },
    ),
  );
}

  Widget phntTxtForm1(double width, double height,Color colors,int maxline,TextEditingController controller,String type) {
  return Container(
    width: width,
    // height: height,
    child: TextFormField(
      enabled:type=="Request"?false:true,
      controller: controller,
      maxLines: maxline,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        filled: true,
        fillColor: colors,
        labelStyle: const TextStyle(fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is Required";
        } else {

        }
      },
    ),
  );
}

  Widget txtfdtext(String txt, Color txtcolor) {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
    child: Text(
      txt,
      style:
          TextStyle(fontWeight: FontWeight.w300, fontSize: 17, color: txtcolor,fontFamily: "ink nut"),
    ),
  );
}

 Widget fttxt(String txt, Color fontclr,double fontsize, FontWeight fntwgt) {
  return Text(
    txt,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.left,
    style: TextStyle(
        color: fontclr,
        fontSize: fontsize,
        fontFamily: 'ink nut',
        fontWeight: fntwgt),
  );
}

 Widget fonttxt(String txtn, Color fontclr, double fontsize, FontWeight fntwgt) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
    child: Text(
      txtn,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: fontclr,
          fontSize: fontsize,
          fontFamily: 'ink nut',
          fontWeight: fntwgt),
    ),
  );
}

 Widget divider(double height,double thickness,Color mycolor) {
  return Divider(
    height: height,
    thickness: thickness,
    color: mycolor,
  );
}

  Widget richtxt(String txt,Color fntclr ,double fontsize,FontWeight fntwgt){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: RichText(
      text:  TextSpan(
        text: txt,
          style: TextStyle(
              color: fntclr,
              fontSize: fontsize,
              fontFamily: 'ink nut',
              fontWeight: fntwgt),
                children: <TextSpan>[
           TextSpan(text: ':',
              style: TextStyle(fontWeight: FontWeight.w900, color: twhite,fontSize: 18)),
        ],
      ),
    ),
  );
  }
  Widget  Addtxtfield (String txt,double height,double width,Color colorme,TextEditingController controlller,int maxline){
   return   SizedBox(
     width: width,
     // height: height,
     child: TextFormField(
       controller: controlller,
        maxLines: maxline,
       decoration:  InputDecoration(
         filled: true,//to show the color in txtfield
         fillColor:colorme ,
         hintText: txt,
         border: OutlineInputBorder(
         ),

         contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
       ),
       validator: (value) {
         if (value!.isEmpty) {
           return "This field is Required";
         } else {

         }
       },

     ),
   );
  }
  Widget  phntTxtForm2 (String txt,double height,double width,Color colorme,TextEditingController controlller,int maxline){
   return   SizedBox(
     width: width,
     // height: width,
     child: TextFormField(

       keyboardType: TextInputType.number,
       inputFormatters: [LengthLimitingTextInputFormatter(10)],
       controller: controlller,
        maxLines: maxline,
       decoration:  InputDecoration(
         filled: true,//to show the color in txtfield
         fillColor:colorme ,
         hintText: txt,
         border: OutlineInputBorder(

         ),
         contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
       ),
       validator: (value) {
         if (value!.isEmpty) {
           return "This field is Required";
         } else {

         }
       },
     ),
   );
  }
  InputBorder border=OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: lgrey,width: 0.2)
  );
Widget divider2() {
  return Divider(
    color: Color(0xff0000001F),
    thickness: 1,
  );
}
Widget addTxtForm1(double width, double height,int maxline,TextEditingController controllers,) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    width: width,
    // height: height,
    // color: Colors.red,
    child: TextFormField(

      controller: controllers,

      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintMaxLines: maxline,
          filled: true,
          fillColor:Colors.grey.shade200,
          isDense: true,
          labelStyle: const TextStyle(fontSize: 15),
          focusedBorder:border,
          enabledBorder: border,
          errorBorder: border,
          border:border

      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is Required";
        } else {

        }
      },
    ),
  );
}
Widget addTxtForm2(double width, double height,int maxline,TextEditingController controllers,int maxLength) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    width: width,
    // height: height,
    // color: Colors.red,
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],

      controller: controllers,

      decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintMaxLines: maxline,
          filled: true,
          fillColor:Colors.grey.shade200,
          isDense: true,
          labelStyle: const TextStyle(fontSize: 15),
          focusedBorder:border,
          enabledBorder: border,
          errorBorder: border,
          border:border

      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is Required";
        } else {

        }
      },
    ),
  );
}



