import 'package:flutter/cupertino.dart';

Widget txt(String text,Color color,double font ,bool bold){
  return Text('$text',style: TextStyle(
    fontWeight: bold?FontWeight.bold:null,
    color: color,
    fontSize: font,


  ),

  );

}