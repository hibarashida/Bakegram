import 'package:bakegram/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import 'AddCategory.dart';

class AdmCategory extends StatelessWidget {
  const AdmCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0x91FC1C1C),shape: CircleBorder(),
        child:Icon(Icons.add,color: tblack) ,
        onPressed: () {
          callNext(context,AddCategory(from: "",OldId: '',));

        },),
      appBar: AppBar(
        backgroundColor: bmainColor2,
        leading: InkWell(onTap:() {
          back(context);
        },
            child: Icon(Icons.arrow_back)),
        title: fonttxt("Category",twhite,20,FontWeight.w300),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MainProvider>(builder: (context, value, child) {
              return SizedBox(
                height:height ,
                child: GridView.builder(
                    itemCount: value.Categorymodeldata.length,
                    physics: ScrollPhysics(),
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return InkWell(onDoubleTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: fonttxt("Alert !!!!",tbrown,20,FontWeight.w600),
                            content: const Text(
                                "Do you want to  EDIT or DELETE ?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  value.deletecategory(
                                      value.Categorymodeldata[index].Id);
                                  Navigator.of(context).pop();
                                  value.getCategorydata();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Category deleted successfully")),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("Delete"),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddCategory(
                                                  from: "EDIT",
                                                  OldId: value
                                                      .Categorymodeldata[index].Id
                                              ),
                                        ));
                                    value.editcategory(
                                        value.Categorymodeldata[index].Id);
                                  },
                                  child: Container(
                                    child: Text("Edit"),
                                  ))
                            ],
                          ),
                        );
                      },
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              // color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(value.Categorymodeldata[index].Image),
                                  fit: BoxFit.cover),),
                        ),
                      );
                    }),
              );
            },

            ),
          ],
        ),
      ),
    );
  }

}
