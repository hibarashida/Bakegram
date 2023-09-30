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
            child: Icon(Icons.arrow_back)),
        title: fonttxt("Add Category",twhite,20,FontWeight.w300),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Center(
            child: Consumer<MainProvider>(builder: (context, value, child) {
              return   Container(
                width: 170,
                height: 150,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                ),child:InkWell(onTap: () {
                showBottomSheet(context);
              },
                  child:  value.ProductFileImage==null?
                  Center(child: Text("add productimg")):Image.file(value.ProductFileImage!)),
              );
            },

            ),
          ),
          SizedBox(height: 50,),
          Consumer<MainProvider>(builder:(context, value, child) {
            return  Addtxtfield(
                " enter category",width/1.1, height/10 ,lghtwcolor,value.categorynamecontroller,1);
            },
          ),
         SizedBox(
           height: 10,
         ),
         Consumer<MainProvider>(builder: (context, value3, child) {
           return  InkWell(onTap: () {
             value3.Addcategoryimg();
             value3.Clear();
           },
               child: btn(bmaincolor3, "ADD", twhite, width/2, height / 15));
           },
         ),
        ],
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
