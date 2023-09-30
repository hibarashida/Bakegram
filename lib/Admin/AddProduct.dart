import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ModelClass/CategoryModelClass.dart';
import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/myColors.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';

class AddProduct extends StatelessWidget {
  String from;
  String oldId;
   AddProduct({super.key,required this.from,required this.oldId});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back)),
        title: fonttxt(" Add Products",twhite,20,FontWeight.w300),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 50,),
            Consumer<MainProvider>(builder: (context, value, child) {
              return  Center(
                child: Container(
                  width: 170,
                  height: 150,
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                  ),
                  child:InkWell(onTap: () {
                    showBottomSheet(context);
                  },
                      child:  value.ProductFileImage==null?
                      Center(child: Text("add categoryimg")):Image.file(value.ProductFileImage!)),
                ),
              );
            },

            ),
            // SizedBox(height: 50,),
            Consumer<MainProvider>(builder: (context, value1, child) {
              return   Addtxtfield(
                " name",width/1.1, height/10 ,lghtwcolor,value1.prdctnamecontroller,1);
            },

            ),
            Consumer<MainProvider>(builder: (context, value2, child) {
              return   Addtxtfield(
                "description",width/1.1, height/10 ,lghtwcolor,value2.prdctDescriptioncontroller,4);
            },

            ),
            SizedBox(height: 15),
            Consumer<MainProvider>(builder: (context, value3, child) {
              return   Addtxtfield(
                " ingridient",width/1.1, height/10 ,lghtwcolor,value3.prdctingredientcontroller,2);
            },

            ),
            Consumer<MainProvider>(builder: (context, value4, child) {
              return   phntTxtForm2(
                " dicsount",width/1.1, height/10 ,lghtwcolor,value4.Prdctdiscountcontroller,1);
            },

            ),
            Consumer<MainProvider>(builder: (context, value5, child) {
              return   phntTxtForm2(
                " RS",width/1.1, height/10 ,lghtwcolor,value5.PrdctPricecontroller,1);
            },

            ),
            Row(
              children: [
                 Text(
                  "Category :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: tbrown),
                ),
                SizedBox(
                  width: width / 1.5,
                  child: Consumer<MainProvider>(
                      builder: (context, value, child) {
                        return Autocomplete<CategoryModel>(
                          optionsBuilder:
                              (TextEditingValue textEditingValue) {
                            return value.Categorymodeldata
                                .where((CategoryModel item) => item.Name
                                .toLowerCase()
                                .contains(
                                textEditingValue.text.toLowerCase()))
                                .toList();
                          },
                          displayStringForOption: (CategoryModel option) =>
                          option.Name,
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController
                              fieldTextEditingController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              fieldTextEditingController.text =
                                  value.Categorycontroller.text;
                            });

                            return SizedBox(
                              child: TextField(
                                maxLines: null,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 14),
                                  hintStyle: TextStyle(
                                      color:tblack.withOpacity(0.6),
                                      fontFamily: "PoppinsMedium",
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                  fillColor:lghtwcolor,
                                  filled: true,
                                  border: const UnderlineInputBorder(
                                    // borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    // borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                  enabledBorder: const UnderlineInputBorder(
                                    // borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey),
                                  ),
                                  hintText: "Select a category",
                                  suffixIcon:  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 25,
                                    color: tblack,
                                  ),
                                ),
                                onChanged: (txt) {
                                  // value.categyct.text = txt;
                                  print("ololololo");
                                },
                                controller: fieldTextEditingController,
                                focusNode: fieldFocusNode,
                              ),
                            );
                          },
                          onSelected: (CategoryModel selection) {
                            value.Categorycontroller.text = selection.Name;
                            value.productSelectedCategoryID = selection.Id;
                            print(selection.Id + "asdfg");
                            // value.requestMemberAssembly=selection.assembly;
                            // value.requestMemberDistrict=selection.district;
                            // value.requestMemberState=selection.state;
                          },
                          optionsViewBuilder: (BuildContext context,
                              AutocompleteOnSelected<CategoryModel> onSelected,
                              Iterable<CategoryModel> options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                child: Container(
                                  width: 200,
                                  height: 300,
                                  color:twhite,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(10.0),
                                    itemCount: options.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final CategoryModel option =
                                      options.elementAt(index);

                                      return GestureDetector(
                                        onTap: () {
                                          onSelected(option);
                                        },
                                        child: Container(
                                          color: twhite,
                                          height: 50,
                                          width: 200,
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(option.Name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                const SizedBox(height: 10)
                                              ]),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),

            // SizedBox(
            //   height: 10,
            // ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return InkWell(onTap: () {
                value.AddProductdata();
                value.Clear1();


              },
                  child: btn(bmaincolor3, "ADD", twhite, width/2, height / 15));
            },

            ),
          ],
        ),
      ),




    );
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
            )
        ),
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
                  onTap: () => {donationProvider.getImgcamera(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: bmaincolor3),
                  title: const Text('Gallery',),
                  onTap: () => {donationProvider.getImggallery(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }

}
