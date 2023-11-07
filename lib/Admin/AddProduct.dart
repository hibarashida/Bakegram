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
  final formKey = GlobalKey<FormState>();

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
            child: Icon(Icons.arrow_back,color: twhite,)),

        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Text(from=="EDIT"?"EdIT Products ":" Add Products", textAlign: TextAlign.left,
            style: TextStyle(color: twhite, fontSize: 20, fontFamily: 'ink nut', fontWeight: FontWeight.w300),
          ),
        )
      ),
      body:SingleChildScrollView(
        child: Form(key: formKey,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 50,),
              Consumer<MainProvider>(builder: (context, value, child) {
                return  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: InkWell(onTap: () {
                      showBottomSheet(context);
                    },
                      child: value.ProductFileImage!=null?Container(
                        width: 170,
                        height: 150,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                        ),
                        child: Image.file(value.ProductFileImage!,fit: BoxFit.fill),
                      ):value.imgs!=''?Container(
                        width: 170,
                        height: 150,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                        ),
                        child: Image.network(value.imgs,fit: BoxFit.fill),
                      ):Container(
                        width: 170,
                        height: 150,
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: bmainColor2),
                        ),
                        child: Image.asset("assets/add.png",fit: BoxFit.fill),
                      )
                    ),
                  ),
                );
              },
              ),
              Consumer<MainProvider>(builder: (context, value1, child) {
                return   Addtxtfield(
                  " name", height/10 ,width/1.1,lghtwcolor,value1.prdctnamecontroller,1);},
              ),
              SizedBox(height: 15),
              Consumer<MainProvider>(builder: (context, value2, child) {
                return   Addtxtfield(
                  "description",height/10 ,width/1.1,lghtwcolor,value2.prdctDescriptioncontroller,4);
              },
              ),
              SizedBox(height: 15),
              Consumer<MainProvider>(builder: (context, value3, child) {
                return   Addtxtfield(
                  " ingrdient",height/10 ,width/1.1 ,lghtwcolor,value3.prdctingredientcontroller,2);
              },
              ),
              SizedBox(height: 15),
              Consumer<MainProvider>(builder: (context, value4, child) {
                return   phntTxtForm2(
                  " dicsount",height/10 ,width/1.1  ,lghtwcolor,value4.Prdctdiscountcontroller,1);
              },
              ),
              SizedBox(height: 15),
              Consumer<MainProvider>(builder: (context, value5, child) {
                return   phntTxtForm2(
                  " RS",height/10 ,width/1.1  ,lghtwcolor,value5.PrdctPricecontroller,1);
              },

              ),
              SizedBox(height: 15),
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
                                child: TextFormField(
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 14),
                                    hintStyle: TextStyle(
                                        color:tblack.withOpacity(0.6),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    fillColor:lghtwcolor,
                                    filled: true,
                                    border: const UnderlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.red),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)),
                                    enabledBorder: const UnderlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30),

                                    ),
                                    hintText: "Select a category",
                                    suffixIcon:  Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 25,
                                      color: tblack,
                                    ),
                                  ),
                                  onChanged: (txt) {

                                  },
                                  controller: fieldTextEditingController,
                                  focusNode: fieldFocusNode,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    } else {

                                    }
                                  },
                                ),
                              );
                            },
                            onSelected: (CategoryModel selection) {
                              value.Categorycontroller.text = selection.Name;
                              value.productSelectedCategoryID = selection.Id;
                              print(selection.Id + "asdfg");
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
                                                  const SizedBox(height: 10)]),
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
              Consumer<MainProvider>(builder: (context, value, child) {
                return InkWell(onTap: () {
                  final FormState? form = formKey.currentState;
                if(form!.validate()) {
                  if(value.ProductFileImage!=null||value.imgs!=''){
                    if (from == "NEW") {
                      value.AddProductdata(from, '',context);
                    } else {
                      value.AddProductdata(from, oldId,context);
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
                child:Padding(padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
                  child: value.productloader?CircularProgressIndicator(color: bmainColor2,):Container(
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


                ) );
              },

              ),
            ],
          ),
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
