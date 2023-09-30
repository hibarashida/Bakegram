import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider BakegramProvider=Provider.of<MainProvider>(context);
    BakegramProvider.getCategorydata();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lpink2,
      appBar: myAppbar(width),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: height,
              width: width/3,
              color: maincontcolor,
              child:
              SizedBox(
                height: 110,
                child: Consumer<MainProvider>(builder:(context, value1, child) {
                  return ListView.builder(
                    itemCount:value1.Categorymodeldata.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                const CircleAvatar(
                                  radius: 31,
                                  backgroundColor: Colors.black12,
                                ),
                                Positioned(
                                  top: 1,
                                  left: 1,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                    NetworkImage(value1.Categorymodeldata[index].Image),
                                  ),
                                ),
                              ],
                            ),
                            fonttxt(value1.Categorymodeldata[index].Name,twhite,15,FontWeight.w500 ),
                          ],
                        ),
                      );
                    },
                  );
                },
                ),
              ),
            ),
            Container(
              height: height,
              width: width/1.5,
              color:lpink2,
            )
          ],
        ),
      ),
    );
  }
}
