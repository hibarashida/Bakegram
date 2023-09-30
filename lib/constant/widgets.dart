
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'callfunction.dart';
import 'myColors.dart';


 Widget btn(Color myColor, String text, Color textmycolor, double width,double height) {
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
            fontSize: 20, fontWeight: FontWeight.w700, color: textmycolor),
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
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: maincontcolor,
      ),
      child: Row(
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
          Column(children: [
            Text("ghjk"),
            Text("ghjk"),
            Text("ghjk"),
            Text("ghjk"),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor:twhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Text("gh"),
                    ),
                    Icon(Icons.minimize),
                  ],
                ),
              ),
              Container(
                height: 19,
                width: 70,
                color: Colors.yellow,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_sharp,
                      size: 15,
                    ),
                    Text("remove")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

 PreferredSizeWidget myAppbar(double width) {
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
// PreferredSizeWidget admAppbar(String txt){
//    return AppBar(
//      backgroundColor: bmainColor2,
//      leading: InkWell(onTap:() {
//        back(context);
//      },
//          child: Icon(Icons.arrow_back)),
//      title:fonttxt(txt,twhite,20,FontWeight.w300) ,
//      actions: [
//        Image.asset("assets/bakegramlogo.png",scale: 5,)],
//
//    );
// }


  Widget rtTxtForm1(double width, double height) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      decoration: InputDecoration(
        hintMaxLines: 3,
        filled: true,
        fillColor: twhite,
        labelStyle: const TextStyle(fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

  Widget phntTxtForm1(double width, double height,Color colors,int maxline,TextEditingController controllers) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      controller: controllers,
      maxLines: maxline,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      decoration: InputDecoration(
        filled: true,
        fillColor: colors,
        labelStyle: const TextStyle(fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

  Widget txtfdtext(String txt, Color txtcolor) {
  return Padding(
    padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
    child: Text(
      txt,
      style:
          TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: txtcolor),
    ),
  );
}

 Widget gtxt(String txt, Color txtcolor) {
  return Text(
    txt,
    style:
        TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: txtcolor),
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

 Widget divider() {
  return Divider(
    height: 1,
    thickness: 1.5,
    indent: 8,
    endIndent: 8,
    color: tblack,
  );
}

  Widget richtxt(String txt,Color fntclr ,double fontsize,FontWeight fntwgt){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10,
        // vertical: 5
    ),
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
     width: height,
     height: width,
     child: TextField(
       controller: controlller,
        maxLines: maxline,
       decoration:  InputDecoration(
         filled: true,//to show the color in txtfield
         fillColor:colorme ,
         hintText: txt,
         border: OutlineInputBorder(

         ),
         contentPadding: EdgeInsets.only(top: 4),
       ),
     ),
   );
  }
  Widget  phntTxtForm2 (String txt,double height,double width,Color colorme,TextEditingController controlller,int maxline){
   return   SizedBox(
     width: height,
     height: width,
     child: TextField(
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
         contentPadding: EdgeInsets.only(top: 4),
       ),
     ),
   );
  }


