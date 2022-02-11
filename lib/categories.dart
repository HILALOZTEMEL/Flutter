import 'dart:ffi';

import 'package:deneme1/components/header.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'components/bottomNavigation.dart';

class CategoriesPage extends StatefulWidget{

  @override
  _CategoriesPageState createState()=>_CategoriesPageState();

}


class _CategoriesPageState extends State<CategoriesPage>{

  final List<String> categories=[
     "All",
     "Accessories",
     "Computers",
     "Smartphone",
     "Smart Objects",
     "Speakers",
  ];

  @override
  Widget build(BuildContext context){
    double screenWidht=MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
        child: Stack(
        children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal:16 ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

    children: [
     header("Categories", context),
      
      SizedBox(height: 16),
      //categories list
      Expanded(//like list view ,but expanded not need size
        child: ListView(children:
          categories.map((String title) => buildCategory(title,context)).toList()

        ),
      )



    ],),


    ),
          //Bottom Navigation Bar
          bottomNavigationBar("search"),
        ],),),);

        }
}

Widget buildCategory(String title,context){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context){
        return CategoryPage(title);
      }));
    },
    child:Container(
    padding: EdgeInsets.all(24),
    margin: EdgeInsets.only(bottom: 16),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
          offset: Offset(0,4),
        ),
      ],
    ),
    child: Text(
      title,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xffa00a0a)
      ),
    ),
    ),
  );
}