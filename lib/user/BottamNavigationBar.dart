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
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [UsrHomeScreen(),Category(), CartScreen(),ProfileScreen(),];
    MainProvider provider = Provider.of<MainProvider>(context, listen: true);
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
                icon: Icon(Icons.home_sharp,color: twhite,)),
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(1);
                },
                icon: Icon(Icons.category,color: twhite)),

            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(2);
                },
                icon: Icon(Icons.shopping_cart_rounded,color: twhite)),
            IconButton(
                onPressed: () {
                  provider.onItemTapped(3);
                },
                icon: Icon(Icons.person,color: twhite))
          ],
        ),
      ),

      body: pages[provider.selectedIndex],
    );
  }
}
