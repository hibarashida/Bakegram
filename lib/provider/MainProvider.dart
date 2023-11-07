import 'dart:collection';
import 'dart:io';

import 'package:bakegram/ModelClass/CategoryModelClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ModelClass/AddUsermodelclass.dart';
import '../ModelClass/CarosuelModel Class.dart';
import '../ModelClass/CustomerModelclass.dart';
import '../ModelClass/ProductModelClass.dart';
import '../ModelClass/cartdetailsmodelcls.dart';
import '../ModelClass/delivaryadresmodelclass.dart';
import '../constant/callfunction.dart';
import '../constant/myColors.dart';


class MainProvider extends ChangeNotifier {
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");
  List<CategoryModel>Categorymodeldata = [];
  List<ProductModel>Productmodeldata = [];
  List<ProductModel>topsellerdata = [];

  List<ProductModel>filterProductmodeldata = [];
  List<Customerdetails>customerRegister=[];
  List<delivaryaddress>addressdetails=[];
  List<Cartdetails>cartprdtdetails=[];
  List<Carosusel>carouselimg=[];
  

  final FirebaseFirestore db = FirebaseFirestore.instance;


  //bottamnavigation
  int selectedIndex = 0;

  //Carousel indicator
  int Activeindex = 0;
  // int Activeindex1 = 0;


  //bottamnavigation
  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  //Carousel indicator
  void activeIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }

  //registerradiobtn
  String checkvalue = "";

  void gender(String? val) {
    checkvalue = val!;
    notifyListeners();
  }

  String address123 = "";

  void address(valu) {
    // address123 = valu!;
    notifyListeners();
  }

  //addimgpicker = catergory

  File? Categoryfileimg;
  String  img = "";

  //addimagepicker=product
  File ? ProductFileImage;
  String imgs = "";

  //addimgpicker = carousel

  File? CarouselFileimg;
  String Images = "";

  //addimagepicker = registerscren

  File? Registerfileimg;
  String Image="";

  void Inrement(int count,String id, double amount) {
    print("oooo");
    for(var e in cartprdtdetails){
      if(e.cartid == id){
          count = e.count++;
          print("ghjk" + e.price.toString());
          print("erty" + amount.toString());
          print("vbn" + count.toString());
          if (count != 0) {
            e.price = e.price * count;
          }
          print("dfg" + amount.toString());
          notifyListeners();
      }
    }
    notifyListeners();
    // cnt=count+1;
    print(amount.toString()+"mmmm");
    notifyListeners();
  }

  void Decrement(int count,String id,double amount) {
    for(var e in cartprdtdetails){
      if(e.cartid == id) {
        if (count > 1) {

          count = e.count--;
          e.price=e.price/count;
          notifyListeners();
        }
      }
    }
    notifyListeners();
  }

  //shapeproductdetails

  String  ShapesSelect="";
  void shapeSelection(String shape){
    ShapesSelect = shape;
    notifyListeners();
  }
  String  FlavourSelect="";
  void flavourSelection(String flavour){
    FlavourSelect = flavour;
    notifyListeners();
  }
 String  EventsSelect="";
  void EventsSelection(String Events){
    EventsSelect = Events;
    notifyListeners();
  }
  String  LayerSelect="";
  void layerSelection(String layer){
    LayerSelect = layer;
    notifyListeners();
  }
  String  themeSelect="";
  void themeSelection(String layer){
    themeSelect = layer;
    notifyListeners();
  }




  TextEditingController productSearchController =TextEditingController();

  //add category data
  TextEditingController categorynamecontroller = TextEditingController();
  bool categoryloader = false;

  Future<void> Addcategoryimg(String from ,String OldId,BuildContext ctxt)  async {
    categoryloader= true;
    notifyListeners();

    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> categorymap = HashMap();

    categorymap["Category_Name"] = categorynamecontroller.text;

    if (Categoryfileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(Categoryfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          categorymap["Photo"] = value;
          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      categorymap['photo'] = img;
      // editMap['IMAGE_URL'] = imageUrl;
    } if(from=="NEW"){
      categorymap["Category_Id"] = id;
    }if(from=="EDIT"){
      db.collection("Category").doc(OldId).update(categorymap);
      notifyListeners();
    }else{
      db.collection("Category").doc(id).set(categorymap);
      notifyListeners();
    }

    categoryloader =false;
    notifyListeners();

    getCategorydata();
    finish(ctxt);
  }

  void setImage(File image) {
    Categoryfileimg = image;
    // print("234567sdfg"+Categoryfileimg.toString());

    notifyListeners();
  }

  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // print("hjkl"+pickedImage.path);
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }

  }

  void CategoryClear() {
    categorynamecontroller.clear();
    Categoryfileimg=null;
    img="";

  }


  bool loader=false;
  void getCategorydata() {
    // print("foiiuriu");
    loader = true;
    // notifyListeners();

    db.collection("Category").get().then((value) {
      if (value.docs.isNotEmpty) {
        Categorymodeldata.clear();
      loader = false;
      notifyListeners();
        // print("ufruf"+value.docs.length.toString());
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          Categorymodeldata.add(CategoryModel(
              map["Category_Id"].toString(),
              map["Photo"].toString(),
              map["Category_Name"].toString()));
          notifyListeners();
        }


        // print("fghjk"+Categorymodeldata.length.toString());
      }
      notifyListeners();
    }
    );
  }

  void editcategory(String id) {
    db.collection('Category').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMaps = value.data() as Map;
      if (value.exists) {
        categorynamecontroller.text = dataMaps["Category_Name"].toString();
        img = dataMaps["Photo"];
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void deletecategory(String id,BuildContext cnts) {
    db.collection("Category").doc(id).delete();
    getCategorydata();
    ScaffoldMessenger.of(cnts)
        .showSnackBar(
      SnackBar(backgroundColor: Colors.red,
          content: Text("Product deleted successfully ",style: TextStyle(color:twhite,fontSize: 15),)),
    );
    notifyListeners();
  }

// add product data


  String productSelectedCategoryID = "";


  TextEditingController prdctnamecontroller = TextEditingController();
  TextEditingController prdctDescriptioncontroller = TextEditingController();
  TextEditingController prdctingredientcontroller = TextEditingController();
  TextEditingController Prdctdiscountcontroller = TextEditingController();
  TextEditingController PrdctPricecontroller = TextEditingController();
  TextEditingController Categorycontroller = TextEditingController();



  bool productloader=false;
  Future<void> AddProductdata(String from,String oldId,BuildContext cnt) async {
    productloader=true;
    notifyListeners();
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Productymap = HashMap();
    Productymap["Product_Name"] = prdctnamecontroller.text;
    Productymap["Product_Description"] = prdctDescriptioncontroller.text;
    Productymap["Product_Ingredients"] = prdctingredientcontroller.text;
    Productymap["Product_Discount"] = Prdctdiscountcontroller.text;
    Productymap["Product_Price"] = PrdctPricecontroller.text;
    Productymap["Category"] = Categorycontroller.text;
    Productymap["Category_Id"] = productSelectedCategoryID;

    if (ProductFileImage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(ProductFileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          Productymap["Photo"] = value;
          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      Productymap['Photo'] = imgs;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from=="NEW"){
      Productymap["Product_Id"]=id;
    }
    if(from=="EDIT"){
      db.collection("Products").doc(oldId).update(Productymap);
      notifyListeners();
    }else{
      db.collection("Products").doc(id).set(Productymap);
      notifyListeners();
    }
    productloader=false;
    notifyListeners();

    getProductdata();
    finish(cnt);

  }

  void setImage1(File image) {
    ProductFileImage = image;
    notifyListeners();
  }

  Future getImggallery() async {
    final imgPicker = ImagePicker();
    final pickedImage1 =
    await imgPicker.pickImage(source: ImageSource.gallery);

    if (pickedImage1 != null) {
      setImage1(File(pickedImage1.path));
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage1 =
    await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage1 != null) {
      setImage1(File(pickedImage1.path));
    } else {
      print('No image selected.');
    }
  }

  void Clearprdct() {
    prdctnamecontroller.clear();
    prdctDescriptioncontroller.clear();
    prdctingredientcontroller.clear();
    Prdctdiscountcontroller.clear();
    PrdctPricecontroller.clear();
    Categorycontroller.clear();
    imgs="";
    ProductFileImage=null;
  }

  bool prdgetloader=false;
  void getProductdata() {
    prdgetloader=true;
    notifyListeners();
    db.collection("Products").get().then((value) {

      Productmodeldata.clear();
      if (value.docs.isNotEmpty) {
        prdgetloader=false;
        notifyListeners();
        for (var element in value.docs) {
          Map<dynamic, dynamic> prdctmap = element.data();
          Productmodeldata.add(ProductModel(
              prdctmap["Product_Id"].toString(),
              prdctmap["Photo"].toString(),
              prdctmap["Category_Id"].toString(),
              prdctmap["Product_Name"].toString(),
              prdctmap["Product_Description"].toString(),
              prdctmap["Product_Ingredients"].toString(),
              prdctmap["Product_Discount"].toString(),
              prdctmap["Product_Price"].toString()));
          notifyListeners();
        }
      }
      notifyListeners();
    }
    );
  }
  //topseller
  void gettopsellerprdt(){
    db.collection("Products").where("TOPSELLING",isEqualTo:"YES").get().then((value){
      if (value.docs.isNotEmpty) {
        topsellerdata.clear();
        for (var elements in value.docs) {
          Map<String, dynamic> prdtmap = elements.data();
          topsellerdata.add(ProductModel(
              prdtmap["Product_Id"].toString(),
              prdtmap["Photo"].toString(),
              prdtmap["Category_Id"].toString(),
              prdtmap["Product_Name"].toString(),
              prdtmap["Product_Description"].toString(),
              prdtmap["Product_Ingredients"].toString(),
              prdtmap["Product_Discount"].toString(),
              prdtmap["Product_Price"].toString()));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  void getProductfilterdata() {
    db.collection("Products").get().then((value) {
      Productmodeldata.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> prdctmap = element.data();
          Productmodeldata.add(ProductModel(
              prdctmap["Product_Id"].toString(),
              prdctmap["Photo"].toString(),
              prdctmap["Category_Id"].toString(),
              prdctmap["Product_Name"].toString(),
              prdctmap["Product_Description"].toString(),
              prdctmap["Product_Ingredients"].toString(),
              prdctmap["Product_Discount"].toString(),
              prdctmap["Product_Price"].toString()));
          filterProductmodeldata=Productmodeldata;
          notifyListeners();
        }
      }
      notifyListeners();
    }
    );
  }
  void searchProduct(item) {
    filterProductmodeldata = Productmodeldata
        .where((a) => a.name.toLowerCase().contains(item.toLowerCase()))
        .toList();
    notifyListeners();
  }


  void editproduct(String id) {
    db.collection('Products').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        prdctnamecontroller.text = dataMap["Product_Name"].toString();
        prdctDescriptioncontroller.text =
            dataMap["Product_Description"].toString();
        prdctingredientcontroller.text =
            dataMap["Product_Ingredients"].toString();
        Prdctdiscountcontroller.text = dataMap["Product_Discount"].toString();
        PrdctPricecontroller.text = dataMap["Product_Price"].toString();
        imgs = dataMap["Photo"];
        Categorycontroller.text=dataMap["Category"].toString();
        productSelectedCategoryID=dataMap["Category_Id"].toString();
        notifyListeners();

      }
    });
    notifyListeners();
  }

  void deleteproduct(String id,BuildContext cnt) {
    print("dfghj"+id);
    db.collection("Products").doc(id).delete();
    getProductdata();
    ScaffoldMessenger.of(cnt)
        .showSnackBar(
      SnackBar(backgroundColor: Colors.red,
          content: Text("Product deleted successfully ",style: TextStyle(color:twhite,fontSize: 15),)),
    );
    notifyListeners();
  }


  void getproductadmindata(String catid){
    db.collection("Products").where("Category_Id", isEqualTo: catid).get().then((value) {
      if (value.docs.isNotEmpty) {
        Productmodeldata.clear();
        for (var elements in value.docs) {
          Map<String, dynamic> productmap = elements.data();
          Productmodeldata.add(ProductModel(
              productmap ["Product_Id"].toString(),
              productmap ["Photo"].toString(),
              productmap ["Category_Id"].toString(),
              productmap ["Product_Name"].toString(),
              productmap ["Product_Description"].toString(),
              productmap["Product_Ingredients"].toString(),
              productmap["Product_Discount"].toString(),
              productmap["Product_Price"].toString()));
          notifyListeners();
        }
      }
      notifyListeners();
    });


  }


  //add carosuel img
  TextEditingController Carouselnamecontroller = TextEditingController();


  bool carouseloader=false;
  Future<void> AddCarouselimg( String from,String oldId,BuildContext cnt) async {
    carouseloader=true;
    notifyListeners();

    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Carosuelymap = HashMap();

    Carosuelymap["Carousel_Name"] = Carouselnamecontroller.text;

    if (CarouselFileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(CarouselFileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          Carosuelymap["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      Carosuelymap['PHOTO'] = Images;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from=="NEW"){
      Carosuelymap["Carousel_Id"] = id;
    }
    if(from=="EDIT"){
      db.collection("CAROUSEL").doc(oldId).update(Carosuelymap);
      notifyListeners();
    }else{
      db.collection("CAROUSEL").doc(id).set(Carosuelymap);
      notifyListeners();
    }
    carouseloader=false;
    notifyListeners();

    getCarouselimg();
    finish(cnt);
  }

  void setImage2(File image) {
    CarouselFileimg = image;
    notifyListeners();
  }

  Future getImagegallery1() async {
    final imagePicker1 = ImagePicker();
    final pickedImage1 =
    await imagePicker1.pickImage(source: ImageSource.gallery);

    if (pickedImage1 != null) {
      setImage2(File(pickedImage1.path));
      print("tgyhjkmnb"+pickedImage1.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera1() async {
    final imagePicker2 = ImagePicker();
    final pickedImage1 =
    await imagePicker2.pickImage(source: ImageSource.camera);

    if (pickedImage1 != null) {
      setImage2(File(pickedImage1.path));
    } else {
      print('No image selected.');
    }
  }

  void Clearcarousel() {
    Carouselnamecontroller.clear();
    CarouselFileimg=null;
    Images="";
  }


  void deleteCarousel(String id,BuildContext cnt) {
    print("dfghj"+id);
    db.collection("CAROUSEL").doc(id).delete();
    getCarouselimg();
    ScaffoldMessenger.of(cnt)
        .showSnackBar(
      SnackBar(backgroundColor: Colors.red,
          content: Text("Product deleted successfully ",style: TextStyle(color:twhite,fontSize: 15),)),
    );
    notifyListeners();
  }

  void editCarousel(String id) {
    db.collection('CAROUSEL').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        Carouselnamecontroller.text = dataMap["Carousel_Name"].toString();
        Images = dataMap["PHOTO"];
      }
      notifyListeners();
    });
    notifyListeners();
  }


  bool getcarouselloader=false;
  void getCarouselimg() {
    getcarouselloader=true;
    db.collection("CAROUSEL").get().then((value) {
      carouselimg.clear();
      if (value.docs.isNotEmpty) {
        getcarouselloader=false;
        notifyListeners();
        for (var element in value.docs) {
          Map<dynamic, dynamic> carouselmap = element.data();
          carouselimg.add(Carosusel(
              carouselmap["Carousel_Name"].toString(),
              carouselmap["Carousel_Id"].toString(),
              carouselmap["PHOTO"].toString()));
          notifyListeners();
        }
      }
    });

  }
// add multiple subadress
   List<String>addmultiaddres=[];

  void adddress(){
    addmultiaddres.clear();
    if(registeraddresscontroller.text!=""){
      addmultiaddres.add(registeraddresscontroller.text);
    }
    notifyListeners();
  }


  TextEditingController registernamecontroller = TextEditingController();
  TextEditingController registerphnnocontroller = TextEditingController();
  TextEditingController registeraddresscontroller = TextEditingController();


  Future<void> customerRegistration(String from,String oldid,BuildContext cntxt) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> map = HashMap();
    map["CUSTOMER_ID"] = id;
    map["NAME"] = registernamecontroller.text;
    map["MOBILE_NUMBER"] = registerphnnocontroller.text;
    map["ADDRESS"] = addmultiaddres;
    map["STATUS"] = "REQUEST";


    if (Registerfileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(Registerfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = Image;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from=="NEW"){
      map["CUSTOMER_ID"]=id;
    }

    bool numberStatus=false;

    if(from != "EDIT") {
      numberStatus= await checkNumberExist(registerphnnocontroller.text);
    }

    if (from == "EDIT") {
      db.collection("CUSTOMERS").doc(oldid).update(map);
      notifyListeners();
    } else {
      if(!numberStatus){
        print("dopkdjf");
      db.collection("CUSTOMERS").doc(id).set(map);
      finish(cntxt);
      }else{
        print("djiidi");
        ScaffoldMessenger.of(cntxt).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Number Already Exist",
          ),
        ));
      }

      notifyListeners();
    }
    notifyListeners();
  }


  Future<bool> checkNumberExist(String phone) async {
    print(phone+' hhhh');
    var D = await db
        .collection("CUSTOMERS")
        .where("MOBILE_NUMBER", isEqualTo: phone)
        .get();
    if (D.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }


  void setImageR(File image) {
    Registerfileimg = image;
    notifyListeners();
  }

  Future getImggalleryR() async {
    final imagePicker = ImagePicker();
    final pickedImageR =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImageR != null) {
      cropImage(pickedImageR.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcameraR() async {
    final imgPicker = ImagePicker();
    final pickedImageR =
    await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImageR != null) {
      cropImage(pickedImageR.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      Registerfileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void Clearregister(){
    registernamecontroller.clear();
    registerphnnocontroller.clear();
    addmultiaddres.clear();
    Registerfileimg=null;
    Image="";

  }
  bool requestLoader=false;
  void getRequestCustomers(){
    requestLoader= true;

    notifyListeners();
    // print(requestLoader.toString()+"doidoio");
    db.collection("CUSTOMERS").where("STATUS",isEqualTo: "REQUEST").get().then((value){
      requestLoader =false;
      notifyListeners();
      // print(requestLoader.toString()+"dpeoo");

      customerRegister.clear();
      if (value.docs.isNotEmpty) {

        for (var elements in value.docs) {
          Map<String, dynamic> cusmap = elements.data();
          customerRegister.add(Customerdetails(
              cusmap["CUSTOMER_ID"].toString(),
              cusmap["NAME"].toString(),
              cusmap["PHOTO"].toString(),
              cusmap["ADDRESS"].toString(),
              cusmap["MOBILE_NUMBER"].toString(),));
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }
  void editrequestcutomer(String id){
    db.collection("CUSTOMERS").doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        registernamecontroller.text = dataMap["NAME"].toString();
        registerphnnocontroller.text = dataMap["MOBILE_NUMBER"].toString();
        registeraddresscontroller.text =
            dataMap["ADDRESS"].toString();
        Image = dataMap["PHOTO"].toString();
      }
      notifyListeners();
    });
    notifyListeners();
  }
  void statusApprv(String id,BuildContext ctxt) {
    Map<String, dynamic> dataMap = HashMap();
    Map<String, dynamic> userMap = HashMap();
    dataMap["STATUS"] = "APPROVED";
    db.collection("CUSTOMERS").doc(id).set(dataMap, SetOptions(merge: true));

    userMap["NAME"]= registernamecontroller.text;
    userMap["MOBILE_NUMBER"]= "+91${registerphnnocontroller.text}";
    userMap["TYPE"]="USER";
    userMap["USER_ID"]=id;
    db.collection("USERS").doc(id).set(userMap);


    ScaffoldMessenger.of(ctxt)
        .showSnackBar(
       SnackBar(
        backgroundColor: twhite,

        content: Text("Approved successfully ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color:bmainColor2),
        ) ));

    getRequestCustomers();
    notifyListeners();
    finish(ctxt);
  }
  void statusReject(String id,BuildContext contxt) {
    Map<String, dynamic> dataMap = HashMap();
    dataMap["STATUS"] = "REJECT";
    db.collection("CUSTOMERS").doc(id).set(dataMap, SetOptions(merge: true));
    finish(contxt);
    ScaffoldMessenger.of(contxt)
        .showSnackBar(
       SnackBar(
        backgroundColor: twhite,
          content: Text("Rejected successfully ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color:Colors.red ),)),
    );
    getRequestCustomers();
    notifyListeners();
  }
  bool getCustomerLoader=false;
  void getCustomerInfo(){
    getCustomerLoader=true;
    notifyListeners();
    db.collection("CUSTOMERS").where("STATUS",isEqualTo:"APPROVED").get().then((value){
      getCustomerLoader=false;
      notifyListeners();
      customerRegister.clear();
      if (value.docs.isNotEmpty) {
        for (var elements in value.docs) {
          Map<String, dynamic> cusinfomap = elements.data();
          customerRegister.add(Customerdetails(
            cusinfomap["CUSTOMER_ID"].toString(),
            cusinfomap["NAME"].toString(),
            cusinfomap["PHOTO"].toString(),
            cusinfomap["ADDRESS"].toString(),
            cusinfomap["MOBILE_NUMBER"].toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  List<ProductModel> getSuggestions(String query, List<ProductModel> items) {
    List<ProductModel> matches = [];
    // matches.add(ProductModel());
    matches.retainWhere((s) => s.name.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
  // Future<void> selectDateAndTime(BuildContext context) async {
  //
  //   await _selectDate(context);
  //   await _selectTime(context);
  // }

  TimeOfDay _popotime =  TimeOfDay.now();
  DateTime _date =  DateTime.now();
  DateTime scheduledTime=DateTime.now();
  DateTime scheduledDate=DateTime.now();
  String scheduledDayNode="";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate:  DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledDate =  DateTime(_date.year, _date.month, _date.day );
      dateController.text=outputDateFormat.format(scheduledDate);
      notifyListeners();
    }
  }



  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _popotime,
    );

    if (picked != null) {
      _popotime = picked;
      // print("mvbnm"+_popotime.toString());
      scheduledTime =  DateTime(_date.day,_date.month,_date.year,_popotime.hour, _popotime.minute);
      timeController.text=outputTimeFormat.format(scheduledTime);
      // print("fdoff"+scheduledTime.toString());

      notifyListeners();

    }
    notifyListeners();
    // print(timeController.text);
  }
  void tdpickerclear(){
    timeController.clear();
    dateController.clear();
  }

  //adduser
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  List<AddUserModel> userList = [];


  bool adduserLoader=false;
  void addUsers(String from, String oldid,BuildContext cnt) {
    addressBool=true;
    notifyListeners();
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> dataMap = HashMap();

    dataMap["NAME"] = userNameController.text;
    dataMap["MOBILE_NUMBER"] = '+91${mobNoController.text}';
    dataMap["TYPE"] = dropdownvalue;

    if (from == "NEW") {
      dataMap["USER_ID"] = id;
    }

    if (from == "EDIT") {
      db.collection("USERS").doc(oldid).update(dataMap);
      notifyListeners();
    } else {
      db.collection("USERS").doc(id).set(dataMap);
      notifyListeners();
    }

    adduserLoader=false;
    notifyListeners();
    finish(cnt);
  }

  void editInfo(String id) {
    db.collection('USERS').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        userNameController.text = dataMap["Name"].toString();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void getInfoUser() {
    db.collection('USERS').get().then((value) {
      userList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data();
          userList.add(AddUserModel(
            map["NAME"].toString(),
            map["MOBILE_NUMBER"].toString(),
            map["TYPE"].toString(),
            map["USER_ID"].toString(),

          ));
          notifyListeners();
        }
      }
    });
  }
  //admpage usertype
  String dropdownvalue = 'UserType';
  var Type = [
    'UserType',
    'ADMIN',
    'CUSTOMER',
  ];
  void adduserclear(){
    userNameController.clear();
    mobNoController.clear();
    dropdownvalue="UserType";
  }




  void dropdown(String? newValue) {
    dropdownvalue = newValue!;
    notifyListeners();
  }
  // userpage productpage layer
  String dropdownval = '1';
  var layer = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
  void dropdown1(String? newVal) {
    dropdownval = newVal!;
    notifyListeners();
  }
 // userpage productpage color
  String dropdownvale = 'color';
  var Color = [
    'color',
    'pink',
    'white',
    'black',
    'red',
    'blue',
    'yellow',
    'green',
  ];
  void dropdown2(String? newVal1) {
    dropdownvale = newVal1!;
    notifyListeners();
  }
  //radiobutton home or work
  String checkvalue1 = "";

  void ordertype(String? val) {
    checkvalue1 = val!;
    notifyListeners();
  }

  String checkvalue2 = "";

  void ordertypes(String? val) {
    checkvalue2 = val!;
    notifyListeners();
  }

  // checkbox
  bool whatsapp = false;
  void radioButtonChanges(bool bool) {
    notifyListeners();
    whatsapp = bool;
    notifyListeners();

    if (bool) {
      dwhastappnocontroller.text = dphnnumbercontroller.text;
      notifyListeners();
    }
  }
   String addressid="";
  String name="";
  String phonenumber="";
  String whatsappnumber="";
  String naddress="";
  String pincode="";
  String choice="";
  String destination="";



  //delivary address
   TextEditingController dnamecontroller = TextEditingController();
  TextEditingController dphnnumbercontroller = TextEditingController();
  TextEditingController dwhastappnocontroller = TextEditingController();
  TextEditingController dadresscontroller = TextEditingController();
  TextEditingController dpincodecontroller = TextEditingController();


  void adddelivaryadrs(String userId){
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> addressmap = HashMap();
     addressmap["ADRESS_ID"]=id;
     addressmap["USER_ID"]=userId;
     addressmap["FULL_NAME"] =dnamecontroller.text;
     addressmap["MOBILE_NUMBER"]=dphnnumbercontroller.text;
     addressmap["WHATSAPP_NUMBER"]=dwhastappnocontroller.text;
     addressmap["ADDRESS"]=dadresscontroller.text;
     addressmap["PINCODE"]=dpincodecontroller.text;
     addressmap["CHOICE"]=checkvalue2;
     addressmap["DESTINATION"]=checkvalue1;

     db.collection("DELIVARY_ADDRESS").doc(id).set(addressmap);
    notifyListeners();
  }
  void adresclear()
  {
    dpincodecontroller.clear();
    dadresscontroller.clear();
    dwhastappnocontroller.clear();
    dphnnumbercontroller.clear();
    dnamecontroller.clear();
    checkvalue1="";
    checkvalue2="";
  }

  bool addressBool = false;
  
   void getdelivaryadrs(String userId){
    db.collection("DELIVARY_ADDRESS").get().then((value) {
      addressdetails.clear();
      if(value.docs.isNotEmpty){
        for(var elements in value.docs) {
          Map<String, dynamic> adresmap = elements.data();
          addressdetails.add(delivaryaddress(
            adresmap["FULL_NAME"].toString(),
            adresmap["MOBILE_NUMBER"].toString(),
            adresmap["ADDRESS"].toString(),
            adresmap["PINCODE"].toString(),
            adresmap["ADRESS_ID"].toString(),
            adresmap["CHOICE"].toString(),
            adresmap["DESTINATION"].toString(),
            adresmap["WHATSAPP_NUMBER"].toString()));
        } } else {
        addressBool = true;
        notifyListeners();

        notifyListeners();
      } });
    notifyListeners();
   }
  void editdelivaryadress(String id){
    db.collection("DELIVARY_ADDRESS").doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        dnamecontroller.text = dataMap["FULL_NAME"].toString();
        dphnnumbercontroller.text = dataMap["MOBILE_NUMBER"].toString();
        dwhastappnocontroller.text = dataMap["WHATSAPP_NUMBER"].toString();
        dadresscontroller.text = dataMap["ADDRESS"].toString();
       dpincodecontroller.text = dataMap["PINCODE"].toString();
        checkvalue2= dataMap["CHOICE"].toString();
        checkvalue1= dataMap["DESTINATION"].toString();

        notifyListeners();
      }
    });
    notifyListeners();
  }

  void AddCartdetails(String name,productid,price,discount,ingredients,BuildContext context,photo){
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    
    db.collection("Products").doc(productid).get().then((value){
      if(value.exists){
        Map<dynamic, dynamic> dataMap = value.data() as Map;
        dataMap["SHAPE"]=ShapesSelect;
        dataMap["LAYER"]=LayerSelect;
        dataMap["THEME"]=themeSelect;
        dataMap["FLAVOUR"]=FlavourSelect;
        dataMap["EVENTS"]=EventsSelect;
        dataMap["WEIGHT"]=kgValue;
        dataMap["DATE"]=dateController.text;
        dataMap["TIME"]=timeController.text;
        dataMap["CART_ID"]=id;

        db.collection("CART_PRODUCTS").doc(id).set(dataMap.cast(),SetOptions(merge: true));
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text("Added to cart",style: TextStyle(color: twhite,fontSize: 15,fontWeight: FontWeight.bold))),
      backgroundColor: boxcolor,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    ));
    notifyListeners();
  }
   void getcartdetails(){
     int count=0;
     db.collection("CART_PRODUCTS").get().then((value) {
       cartprdtdetails.clear();
      if(value.docs.isNotEmpty){
        for(var elements in value.docs){
             Map<String,dynamic> cartmap=elements.data();
             cartprdtdetails.add(Cartdetails(
                 int.parse(cartmap["Product_Discount"].toString()),
                 double.parse(cartmap["Product_Price"].toString()),
                 cartmap["Product_Ingredients"].toString(),
                 cartmap["Product_Name"].toString(),
                 cartmap["Photo"].toString(),
                 cartmap["CART_ID"].toString(),
                 cartmap["DATE"].toString(),
                 cartmap["FLAVOUR"].toString(),
                 cartmap["TIME"].toString(),
                 cartmap["WEIGHT"].toString(),
                 count,
                 cartmap["Product_Id"].toString(),
                cartmap["Category_Id"].toString(),
                cartmap["Product_Description"].toString(),
             ));
             notifyListeners();
        }
      }
    notifyListeners();
     });
   }
  void deletecart(String id) {
    // print(id + "123456");
    db.collection("CART_PRODUCTS").doc(id).delete();

    notifyListeners();
  }


  //silder
  int KG = 20;
  double k=20;
  double kgValue = 0;
   void changeValue(int value){
     KG=value.toInt();
     kgValue = KG/2;
     notifyListeners();
   }
// call
  void makingPhoneCall(String Phone) async {
    String url = "";
    url = 'tel:$Phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  //whatsapp
  void whatsappLaunch(
       {@required number, @required message}) async {
    if (number.toString().length == 10) {
      number = "+91$number";
    }
    print(number.toString() + '  JH JNNNN');
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url))
        : print("can't open whatsapp");
    // await canLaunchUrl(Uri.parse(url)) ? launchUrl(Uri.parse(url)) :print("can't open whatsapp");
    // whatsappLaunch(number:number,message: "Hello" );
  }

}

