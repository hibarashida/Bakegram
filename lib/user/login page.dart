import 'package:bakegram/constant/widgets.dart';
import 'package:bakegram/provider/LoginProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import 'RegisterPage.dart';
import 'otpverifyscreen.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
   final FirebaseFirestore db = FirebaseFirestore.instance;

   @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: bmainColor2,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(child: Image.asset("assets/bakegramlogo.png", scale: 2)),
              Text("Welcome...!",
                  style: TextStyle(
                      color: twhite, fontWeight: FontWeight.w400, fontSize: 20)),
              Text("LOGIN and CONTINUE",
                  style: TextStyle(
                      color: twhite, fontWeight: FontWeight.w300, fontSize: 12)),
              Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      controller: value.Loginphnnumber,
                      style: TextStyle(
                          color: twhite,
                          decorationColor: twhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone, color: twhite),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: twhite, width: 3)),
                        hintText: "Phone number", hintStyle: TextStyle(color: twhite),
                        // border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(top: 4),
                      ),
                     onChanged: (value){
                        if(value.length==10) {
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                        }
                      },

                    ),
                  );
                }
              ),
              Consumer<LoginProvider>(
                builder: (context,valu3,child) {
                  return InkWell(
                      onTap: (){
                        // db.collection("collectionPath").doc("45655656565623").set({"data":"12345"},SetOptions(merge: true));
                        //
                        // print("mnsbfhd");

                        if(valu3.Loginphnnumber.text!=''&&valu3.Loginphnnumber.text.length == 10) {



                          // db.collection("USERS").where("MOBILE_NUMBER",isEqualTo:"91${valu3.Loginphnnumber.text}" ).get().then((value) async {
                          // if(value.docs.isNotEmpty){
                            print(valu3.Loginphnnumber.text+"NJJJJJJJJJ");
                             valu3.otpverifycontroller.clear();
                             valu3.sendotp(context);

                          //}
                          // else{
                          //   print("iififiiij");
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content: Center(child: Text("NO USER FOUND",style: TextStyle(color: Colors.white,fontSize: 14))),
                          //       backgroundColor: Colors.red,),
                          //   );
                          // }
                        // });
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(child: Text("Enter Valid PhoneNumber",style: TextStyle(color: Colors.white,fontSize: 14))),
                              backgroundColor: Colors.red,),
                          );
                        }
                        },

                      child:
                      // valu3.loader? const CircularProgressIndicator(color: Colors.white,):
                      btn(twhite, "LOGIN HERE", bmainColor2, width / 1.6, height / 15,16,FontWeight.w600));
                }
              ),
              InkWell(onTap: () {

                callNext(context,RegisterPage(from: "NEW",oldid: "",));
              },
                  child:
                  btn(twhite, "CREATE", bmainColor2, width / 1.6, height / 15,16,FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
