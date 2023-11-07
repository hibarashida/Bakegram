import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';

class AddCategory extends StatelessWidget {
  String from;
  String OldId;
   AddCategory({super.key,required this.from,required this.OldId});
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
        title:  Padding(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Text(from=="EDIT"?"EdIT Category ":" Add  Category", textAlign: TextAlign.left,
            style: TextStyle(color: twhite, fontSize: 20, fontFamily: 'ink nut', fontWeight: FontWeight.w300),
          ),
        )
      ),
      body: SingleChildScrollView(

        child: Form(key: formKey,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Center(
                child: Consumer<MainProvider>(builder: (context, value, child) {
                  return   InkWell(onTap: () {
                    showBottomSheet(context);
                  },
                    child: value.Categoryfileimg!=null?Container(
                      width: 190,
                      height: 180,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                      ),child: Image.file(value.Categoryfileimg!,fit: BoxFit.fill),
                    ):value.img!=""?Container(
                      width: 190,
                      height: 180,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),),
                      child: Image.network(value.img,fit: BoxFit.fill),
                    ) :
                    Container(
                      width: 190,
                      height: 180,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                      ),
                      child:  Image.asset("assets/add.png",fit: BoxFit.fill),
                    )
                  );
                },
                ),
              ),
              SizedBox(height: 50,),
              Consumer<MainProvider>(builder:(context, value, child) {
                return  Addtxtfield(" enter category",height/10 ,width/1.1  ,lghtwcolor,value.categorynamecontroller,1);
                },
              ),
             SizedBox(
               height: 10,
             ),
             Consumer<MainProvider>(builder: (contxt, value3, child) {
               return  InkWell(onTap: () {
                 final FormState? form = formKey.currentState;
                 if(form!.validate()) {
                      if(value3.Categoryfileimg!=null||value3.img!='') {
                        if (from == "NEW") {
                          value3.Addcategoryimg(from, "",context);
                        } else {
                          value3.Addcategoryimg(from, OldId,context);
                        }
                      }else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(backgroundColor: Colors.red,
                              content: Text("product photo provide",style: TextStyle(color:twhite,fontSize: 15),)),
                        );
                      }
                 }
               },
                   child: Padding(padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
                     child:value3.categoryloader?CircularProgressIndicator(): Container(
                       height: height / 15,
                       width: width/2,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(14),
                         color: bmaincolor3,
                       ),
                       child: Center(
                           child: Text(from=="EDIT"?"EDIT":"ADD", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w600, color: twhite),
                           )),
                     ),


                   ));
               },
             ),
            ],
          ),
        ),
      ),
    ) ;
  }
  void showBottomSheet(BuildContext context) {
    MainProvider donationProvider =Provider.of<MainProvider>(context,listen: false);

    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: bmaincolor3,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {donationProvider.getImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: bmaincolor3),
                  title: const Text('Gallery',),
                  onTap: () => {donationProvider.getImagegallery(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
}
