import 'package:deneme1/label.dart';
import 'package:flutter/material.dart';

import 'components/bottomNavigation.dart';
import 'components/header.dart';


class ProductDetailPage extends StatefulWidget{

  String productTitle;
  String productPhotoUrl;
  String productPrice;
  ProductDetailPage(this.productTitle,this.productPhotoUrl,this.productPrice);
  @override
  _ProductDetailPageState createState()=>_ProductDetailPageState();

}


class _ProductDetailPageState extends State<ProductDetailPage>{
  Color? selectedColor;
  List<Color> colors  =[
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];
  int? selectedCapacity=64;
  List<int> capasities=[64,256,512];
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
                                header(widget.productTitle,context),
                                SizedBox(height: 20),

                                Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(

                                    children: [

                                      //new etiketi
                                      label("New"),
                                      SizedBox(height: 25),
                                      //Ürün fotoğrafı
                                      Image.asset(widget.productPhotoUrl),
                                      SizedBox(height:30),
                                      //Renk seçenekleri
                                      Text(
                                        "Color :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6F7972),
                                        ),
                                      ),
                                      SizedBox(height: 20),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:colors
                                            .map((Color color) => colorOption(
                                            color: color, selected: selectedColor==color,
                                            onTap:(){
                                              setState(() {
                                                selectedColor=color;
                                              });
                                        }

                                        )).toList()
                                      ),
                                      SizedBox(height: 20),


                                      Text(
                                        "Capacities :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6F7972),
                                        ),
                                      ),

                                      //kapasite secenekleri
                                      SizedBox(height: 16),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: capasities.map((int number) => capacityOption(
                                            capacity: number,
                                            selected: selectedCapacity==number,
                                            onTap:(){
                                              setState(() {
                                                selectedCapacity=number;

                                              });
                                        }
                                        )).toList(),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Price :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6F7972),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        widget.productPrice +" USD ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6F7972),
                                        ),
                                      ),
                                      SizedBox(height: 32),

                                      //Sepete ekle butonu
                                      RaisedButton(

                                        padding: EdgeInsets.symmetric(vertical: 16),
                                        disabledColor: Colors.blue.withOpacity(0.12),
                                        disabledTextColor: Colors.blue.withOpacity(0.38),
                                        onPressed: null,
                                        child: Text('        Add to Cart        ' ,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600)),
                                      ),


                                    ],
                                  ),

                                )

                                ],),

        ),
          bottomNavigationBar("search"),
        ],),),);       }
  }
Widget colorOption({required Color color,required bool selected, required Function() onTap}){
  return GestureDetector(
    onTap:onTap,
    child: Container(
      margin: EdgeInsets.only(right:15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:Border.all(color: Color(0xFF0001FC),width:selected ? 3 :0)),
          width: 23,
          height: 23,

    ),
  );
}

Widget capacityOption({required int capacity,required bool selected,required Function() onTap}){
    return GestureDetector(
      onTap:onTap,
      child: Container(
          child: Text(" $capacity GB",
            style: TextStyle(
              color:  Color(selected? 0xFF0001FC:0xFFA7A9BE),
              fontSize:16 )),
        ),

    );
}
