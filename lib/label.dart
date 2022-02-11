import 'package:flutter/material.dart';

Widget label(String text){
     return Container(

       padding: EdgeInsets.all(4),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(2),
           color: Color(0xC6E8D409)),
       child:Text(
         text,
         style:TextStyle(color: Color(0xFF070000),fontSize: 12),
       ),
     );
}