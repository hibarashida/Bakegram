import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';

class AddCarousel extends StatelessWidget {
  String from;
  String oldId;
   AddCarousel({super.key,required this.from,required this.oldId});
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
        title: fonttxt(from=="EDIT"?"EdIT CarouselImage ":" Add  CarouselImage",twhite,20,FontWeight.w300),
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
                      child: value.CarouselFileimg!=null?Container(
                        width: 190,
                        height: 180,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                        ),child: Image.file(value.CarouselFileimg!,fit: BoxFit.fill),
                      ):value.Images!=""?Container(
                        width: 190,
                        height: 180,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),),
                        child: Image.network(value.Images,fit: BoxFit.fill),
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
                return  Addtxtfield(
                    " description",width/10, height/1.1 ,lghtwcolor,value.Carouselnamecontroller,1);
              },
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<MainProvider>(builder: (context, value3, child) {
                return  InkWell(onTap: () {
                  final FormState? form = formKey.currentState;
                  if(form!.validate()) {
                    if(value3.CarouselFileimg!=null||value3.Images!='') {
                      if (from == "NEW") {
                        value3.AddCarouselimg(from, "",context);
                      } else {
                        value3.AddCarouselimg(from, oldId,context);
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
                    child: value3.carouseloader?CircularProgressIndicator(color: bmainColor2,)
                        :btn(bmaincolor3, from=="EDIT"?"EDIT":"ADD", twhite, width/2, height / 15,16,FontWeight.w600));

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
                  onTap: () => {donationProvider.getImagecamera1(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: bmaincolor3),
                  title: const Text('Gallery',),
                  onTap: () => {donationProvider.getImagegallery1(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
}
