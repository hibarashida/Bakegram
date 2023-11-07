import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import 'Productimages.dart';

class SearchScreen extends StatelessWidget {
  String userid;
   SearchScreen({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    MainProvider bakegramProvider=Provider.of<MainProvider>(context);
    // bakegramProvider.filterProductmodeldata.clear();
    return Scaffold(
      backgroundColor: bmainColor2,
       appBar: AppBar(
         backgroundColor: apColor,
         leading: InkWell(onTap:() {
       back(context);
     },
         child:  Icon(Icons.arrow_back,color: twhite)),
         title: Container(
           width: width,
           height: 40,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             color: Colors.white,
           ),
           child: Consumer<MainProvider>(
               builder: (context,value1,child) {
               return TextField(
                 controller: value1.productSearchController,
                 onChanged:(value) {
                   value1.searchProduct(value);
                 },
                 decoration: const InputDecoration(
                   hintText: "Search for products",
                   prefixIcon: Icon(Icons.search),
                   border: OutlineInputBorder(),
                   contentPadding: EdgeInsets.only(top: 4),
                 ),
               );
             }
           ),
         ),
       ),
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return value.productSearchController.text.isNotEmpty? ListView.builder( itemCount: value.filterProductmodeldata.length,
              itemBuilder: (context, index) {
               var items = value.filterProductmodeldata[index];
                return ListTile(
                  onTap: () {
                    callNext(context, ProductImages(photo: items.photo, name:items.name,
                      productid:items.Productid, price: items.price, discount: items.discount,categoryId: items.categoryid,userid: userid,
                      decription:items.description, ingredients:items.ingridient, show:true ,));
                  },
                  leading: Image.network(items.photo),
                  title: Text(items.name),
                  trailing:Transform.rotate(
                    angle: .5,
                      child: Icon(Icons.arrow_back_rounded)),
                );
              },):Center(child: Text("Search Products is empty",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),));}
      ),

    );
  }
}
