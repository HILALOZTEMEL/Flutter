import 'package:deneme1/components/bottomNavigation.dart';
import 'package:deneme1/label.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
class HomePage extends StatefulWidget{
  @override
   _HomePageState createState()=>_HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    double screenWidht=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16 ),
              child: ListView(

                children: [
                  buildHeader(),//Başlık
                  buildBanner(),//banner
                  //butonlar
                  Padding(
                    padding: EdgeInsets.only(top: 48),child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                      //firs eleman
                      buildNavigation(text: "Category", icon: Icons.menu,widget: CategoriesPage() ,context: context),
                      buildNavigation(text: "Favorites", icon: Icons.star_border,  context: context),
                      buildNavigation(text: "Gifts", icon: Icons.card_giftcard,  context: context),
                      buildNavigation(text: "Best Selling", icon: Icons.people,  context: context),




                    ],),
                  ),
                  //sales
                  SizedBox(height: 40),
                  Text(
                    "Sales",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF070000),
                    ),
                  ),
                  SizedBox(height: 16),

                  //sales items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(text: 'Laptop', photoUrl: 'assets/images/monstarAbra.JPG', discount: '-50%', screenWidht: screenWidht),
                      buildSalesItem(text: 'Laptop', photoUrl: 'assets/images/monstarAbra.JPG', discount: '-50%', screenWidht: screenWidht),
                    ],
                  )



                ],),
            ),
            //Bottom Navigation Bar
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}


Widget buildHeader() {
  //başlık
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text("Welcome Bamboo",
      style: TextStyle(
          fontSize: 32,
          color: Color(0xFF070000),
          fontWeight:FontWeight.bold
      ),
    ),
  );

}

Widget buildBanner(){

  return Padding(
    padding:EdgeInsets.only(top:24),
    child:Container(
      width:double.infinity ,
      padding: EdgeInsets.only(
          left: 24,right: 36,top: 14,bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFFE5650F),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Apple Macbook Pro ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4,),
              Text(
                "(Apple M1 Çip,"
                    " 8 GB RAM, "
                    "256 GB SSD)",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4,),
              Text(
                "1209 USD",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Image.asset("assets/images/macbook.png")
        ],
      ) ,
    ) ,
  );




}

Widget buildNavigation({
  required String text ,
  required IconData icon,
  Widget? widget,
  required BuildContext context}){

  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context){
        return widget!;
      }));
    },
    child :Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:19 ,vertical :22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD71010),),
          child:Icon(icon,color: Color(0xFFF1F1F5) ,size: 18,),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle (
            color: Color(0xFF0A0101),
            fontSize: 14,
            fontWeight: FontWeight.w500,

          ),),

      ],
    ),
  );
}

Widget buildSalesItem(
    {required String text,
      required String photoUrl,
      required String discount,
      required screenWidht})
    {return  Container(
      width: (screenWidht-60)*0.5,
      padding: EdgeInsets.only(left: 12,top: 12,bottom: 21,right: 12),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //%50
          label(discount),
          Container(

            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Color(0xC6E8D409)),
            child:Text(
              text,
              style:TextStyle(color: Color(0xFF070000),fontSize: 12),
            ),
          ),

          //Laptop resmi
          Image.asset(photoUrl),
          //modeli
          SizedBox(height: 22),
          Center(
            child: Text(text,
              style: TextStyle(
                  fontSize: 18,color: Color(0xFF0A1034)),),
          )

        ],
      ),);

    }





