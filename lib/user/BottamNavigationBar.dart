import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/myColors.dart';
import '../provider/MainProvider.dart';
import 'CartScreen.dart';
import 'CategoryScreen.dart';
import 'ProfileScreen.dart';
import 'UsrHomeScreen1.dart';


class BottomNav extends StatelessWidget {

  String userid;
  String name;
  String phn;
  String photo;
   BottomNav({Key? key,required this.userid,required this.name,required this.phn,required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      UsrHomeScreen(userId: userid),
      Category(userId: userid),
      CartScreen(userId: userid),
      ProfileScreen(userId: userid,name: name,phn: phn, photo: photo),
    ];
    MainProvider provider = Provider.of<MainProvider>(context, listen: true);
    // print("ghjkl"+provider.selectedIndex.toString());
    return Scaffold(
       // floatingActionButton: ,
      backgroundColor: bmaincolor3,
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(0);
                },
                icon: provider.selectedIndex==0?Icon(Icons.home_sharp,color: bmainColor,size: 30,):Icon(Icons.home_sharp,color: twhite, )),
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.getProductdata();
                  provider.onItemTapped(1);
                },
                icon: provider.selectedIndex==1?Icon(Icons.category,color: bmainColor,size: 30):Icon(Icons.category,color: twhite)),

            IconButton(
              // enableFeedback: false,
                onPressed: () {

                  provider.onItemTapped(2);
                },
                icon: provider.selectedIndex==2?Icon(Icons.shopping_cart_rounded,color: bmainColor,size: 30):Icon(Icons.shopping_cart_rounded,color: twhite)),
            IconButton(
                onPressed: () {
                  provider.onItemTapped(3);
                },
                icon:provider.selectedIndex==3?Icon(Icons.person,color: bmainColor,size: 30):Icon(Icons.person,color: twhite))
          ],
        ),
      ),

      body: pages[provider.selectedIndex],
    );
  }
}
