import 'package:deneme1/components/bottomNavigation.dart';
import 'package:deneme1/components/header.dart';
import 'package:deneme1/productDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryPage extends StatelessWidget{

  String categoryTitle;
  CategoryPage(this.categoryTitle);


  List<Map> products=[
    {"isim":"MACBOOK PRO","fotograf":"assets/images/macbook.png","Fiyat":"1209"},
    {"isim":"MACBOOK Air","fotograf":"assets/images/MACBOOKAİR.jpg","Fiyat":"990"},
    {"isim":"MACBOOK ","fotograf":"assets/images/macbook.png","Fiyat":"999"},
    {"isim":"MONSTAR ABRA","fotograf":"assets/images/monstarAbra.JPG","Fiyat":"1269"},
    {"isim":"HUAWEI","fotograf":"assets/images/HUAWEI.jpg","Fiyat":"999"},
    {"isim":"HP","fotograf":"assets/images/hp.jpg","Fiyat":"999"},
    {"isim":"EXCALIBUR","fotograf":"assets/images/Excalibur.jpg","Fiyat":"599"},
    {"isim":"DEL","fotograf":"assets/images/del.jpg","Fiyat":"999"},
    {"isim":"CASPER","fotograf":"assets/images/casper.jpg","Fiyat":"999"},
    {"isim":"MACBOOK PRO","fotograf":"assets/images/macbook.png","Fiyat":"799"},
    {"isim":"MACBOOK PRO","fotograf":"assets/images/macbook.png","Fiyat":"999"},
    {"isim":"MACBOOK PRO","fotograf":"assets/images/macbook.png","Fiyat":"599"},
  ];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
              child: Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16 ),
                         child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              header(categoryTitle,context),
                              SizedBox(height: 20),
                              //içerekler
                              Expanded(child: GridView.count(crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                children: products.map((Map product){
                                return buildContent(product["isim"],product["fotograf"],product["Fiyat"],context);
                              }).toList(),) )


                ],),

                ),
              bottomNavigationBar("search"),
              ],),),);       }

}

Widget buildContent(String title ,String photoUrl,String price,context){

  return  GestureDetector(

    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context){
        return ProductDetailPage(title,photoUrl,price);
      }));
    },
  child:Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(0,16)
        )
      ],
    ),
    child: Column(
      children: [
        SizedBox(height: 16),
        Image.asset(photoUrl),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: TextStyle(color: Color(0xFF0A1034),fontSize: 16,fontWeight: FontWeight.w500),),
            Text("USD $price",style: TextStyle(color: Color(0xFF0A1034),fontSize: 16,fontWeight: FontWeight.w500),),
            SizedBox(height: 18),
          ],
        )
      ],
    ),
  ));

}
