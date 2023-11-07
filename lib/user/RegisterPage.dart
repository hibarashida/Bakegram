import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/callfunction.dart';
import '../constant/myColors.dart';
import '../constant/widgets.dart';
import '../provider/MainProvider.dart';

class RegisterPage extends StatelessWidget {
  String from,oldid;

   RegisterPage({super.key,required this.from,required this.oldid});
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bmainColor2,
      body:SingleChildScrollView(
        child: Form(key: formKey,
          child: Container(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return InkWell(onTap: () {
                      showBottomSheet( context);
                    },
                     child: Center(
                        child:val.Registerfileimg !=null?
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:FileImage(val.Registerfileimg!,) ,
                        ):val.Image!=''?CircleAvatar(
                          radius: 60,
                          backgroundImage:NetworkImage(val.Image,) ,
                        ):
                        CircleAvatar(radius:60,
                          backgroundColor: twhite ,
                           child:Image.asset("assets/profileicon.png",scale: 4,color: bmainColor2))

                     ),
                    );
                  }
                ),
                txtfdtext("Name",twhite),
                Consumer<MainProvider>(
                  builder: (context,valu1,child) {
                    return Center(child: rtTxtForm1(width/1.1,height/18,1,valu1.registernamecontroller,from));
                  }
                ),
                txtfdtext("mobile number",twhite),
                Consumer<MainProvider>(
                  builder: (context,vale2,child) {
                    return Center(child: phntTxtForm1(width/1.1, height/18,twhite,1,vale2.registerphnnocontroller,from));
                  }
                ),
                txtfdtext("Address",twhite),
                Consumer<MainProvider>(
                  builder: (context,value3,child) {
                    return Center(child: rtTxtForm1(width/1.1,height/18,3,value3.registeraddresscontroller,from));
                  }
                ),
                Consumer<MainProvider>(
                  builder: (context,value4,child) {
                    return from=="Request"? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(onTap: () {
                          value4.statusApprv(oldid,context);

                        },child: btn(twhite, "APPROVE", bmainColor2, width / 3, height / 15,16,FontWeight.w600)),
                        InkWell(onTap: () {

                          value4.statusReject(oldid,context);

                        },child: btn(twhite, "REJECT", bmainColor2, width /3, height / 15,16,FontWeight.w600))
                      ],
                    ):InkWell(onTap: () {
                      value4.adddress();

                      final FormState? form = formKey.currentState;
                      if(form!.validate()) {

                      value4.customerRegistration(oldid,from,context);

                      }
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(top: 100),
                        child: Center(child: btn(twhite, "REGISTER", bmainColor2, width / 1.6, height / 15,16,FontWeight.w600)),
                      ),
                    );
                  }
                ),
               InkWell(onTap: (){
                  back(context);
                  },
                    child:  Text(from=="Request"? "":"already registered.....!",style: TextStyle(color: tbrown),)
              )
              ],
            ),
          ),
        ),
      ) ,

    );
  }
  void showBottomSheet(BuildContext context) {
    MainProvider bakegramProvider =Provider.of<MainProvider>(context,listen:false);
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
                  onTap: () => {bakegramProvider.getImgcameraR(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: bmaincolor3),
                  title: const Text('Gallery',),
                  onTap: () => {bakegramProvider.getImggalleryR(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }

}
