import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/myColors.dart';
import '../constant/widgets.dart';

class CartScreen  extends StatelessWidget {
  const CartScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold( backgroundColor: lpink2,
      appBar: myAppbar(width),
      body:SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fonttxt("My Cart",tblack,20,FontWeight.w600),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 90,
              height: 2,
              color: tblack,
            ),
            maincontainer(bmainColor2, width, height /5),
          ],
        ),
      ) ,

    );
  }
}
