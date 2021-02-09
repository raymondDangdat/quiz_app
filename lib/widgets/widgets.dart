import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return  RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22.0),
        children: [
          TextSpan(text: "Raaxo", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
          TextSpan(text: "Quiz", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue))
        ]
      ));
}