import 'dart:collection';
import 'dart:io';

import 'package:bakegram/ModelClass/CategoryModelClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../ModelClass/ProductModelClass.dart';


class MainProvider extends ChangeNotifier {
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");
  List<CategoryModel>Categorymodeldata=[];
  List<ProductModel>Productmodeldata=[];

  final FirebaseFirestore db = FirebaseFirestore.instance;



  //bottamnavigation
  int selectedIndex = 0;

  //Carousel indicator
  int Activeindex = 0;
  int Activeindex1 = 0;


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

  void activeIndex1(int index) {
    Activeindex1 = index;
    notifyListeners();
  }

  //registerradiobtn
  String checkvalue = "";

  void gender(String? val) {
    checkvalue = val!;
    notifyListeners();
  }

  //addimgpicker = catergory

  File? Categoryfileimg;
  String img = "";

  //addimagepicker=product
  File ? ProductFileImage;
  String imgs="";

  //addimgpicker = carousel

  File? CarouselFileimg;
  String Images="";




  List<String> Carosuelimg = [
    "assets/cakeimg1.png",
    "assets/desserts1.jpg",
    "assets/cakeimg4.png",
    "assets/doughnutimg1.png",
    "assets/cakeimg4.png",
    "assets/cakeimg2.png",
  ];
  List<String> Categoryimg2 = [
    "assets/cakeimg6.jpg",
    "assets/doughnuts2.jpg",
    "assets/bcakeimg2.png",
    "assets/dessert.png",
    "assets/cupcakeimg1.jpg",
  ];
  List<String> Categorytxt = [
    "Cakes",
    "Doughnuts",
    "Brownie",
    "Desserts",
    "Cupcakes",
  ];


  //add category data


  TextEditingController categorynamecontroller = TextEditingController();

  Future<void> Addcategoryimg() async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> categorymap = HashMap();
    categorymap["Category_Id"] = id;
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
    }

    db.collection("Category").doc(id).set(categorymap);
    notifyListeners();
  }

  void setImage(File image) {
    Categoryfileimg = image;
    notifyListeners();
  }

  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {

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

      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }

  }
  void Clear() {
    categorynamecontroller.clear();
  }

 void getCategorydata(){
    db.collection("Category").get().then((value){
      Categorymodeldata.clear();
    if(value.docs.isNotEmpty){
      for(var element in value.docs){
        Map<dynamic, dynamic> map = element.data();
        Categorymodeldata.add(CategoryModel(
            map["Category_Id"].toString(),
            map["Photo"].toString(),
           map["Category_Name"].toString()));
        notifyListeners();
      }
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
  void deletecategory(String id) {
    db.collection("Category").doc(id).delete();
    notifyListeners();
  }

// add product data


  String productSelectedCategoryID = "";


  TextEditingController prdctnamecontroller = TextEditingController();
  TextEditingController prdctDescriptioncontroller=TextEditingController();
  TextEditingController prdctingredientcontroller=TextEditingController();
  TextEditingController Prdctdiscountcontroller=TextEditingController();
  TextEditingController PrdctPricecontroller=TextEditingController();
  TextEditingController Categorycontroller=TextEditingController();

  Future<void> AddProductdata() async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Productymap = HashMap();
    Productymap["Product_Id"] = id;
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
      Productymap['photo'] = imgs;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("Products").doc(id).set(Productymap);
    notifyListeners();
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

  void Clear1() {
    prdctnamecontroller.clear();
    prdctDescriptioncontroller.clear();
    prdctingredientcontroller.clear();
    Prdctdiscountcontroller.clear();
    PrdctPricecontroller.clear();
    Categorycontroller.clear();
  }
  void getProductdata(){
    db.collection("Products").get().then((value){
        Categorymodeldata.clear();
      if(value.docs.isNotEmpty){
        for(var element in value.docs){
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
  void editproduct(String id) {
    db.collection('Products').doc(id).get().then((value) {
      Map<dynamic, dynamic> dataMap = value.data() as Map;
      if (value.exists) {
        prdctnamecontroller.text = dataMap["Product_Name"].toString();
        prdctDescriptioncontroller.text = dataMap["Product_Description"].toString();
        prdctingredientcontroller.text = dataMap["Product_Ingredients"].toString();
        Prdctdiscountcontroller.text = dataMap["Product_Discount"].toString();
        PrdctPricecontroller.text = dataMap["Product_Price"].toString();
        imgs = dataMap["Photo"];
      }
      notifyListeners();
    });
    notifyListeners();
  }
  void deleteproduct(String id) {
    db.collection("Products").doc(id).delete();
    notifyListeners();
  }


//add carosuel img
  TextEditingController Carouselnamecontroller = TextEditingController();

  Future<void> AddCarouselimg() async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Carosuelymap = HashMap();
    Carosuelymap["Carousel_Id"] = id;
    Carosuelymap["Carousel_Name"] = Carouselnamecontroller.text;

    if (CarouselFileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(CarouselFileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          Carosuelymap["Photo"] = value;
          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      Carosuelymap['photo'] = Images;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("Carousel").doc(id).set(Carosuelymap);
    notifyListeners();
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
  void Clear2() {
    Carouselnamecontroller.clear();
  }

}
