import 'package:flutter/material.dart';
import 'package:todo_app/Constants.dart';

Widget Category() {
  return Container(
    margin: new EdgeInsets.symmetric(horizontal: 10.0),
    width: 220,
    height: 118,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 8),
          )
        ]),
    child: Column(
      children: [
        Text(
          "Categories",
          style: TextStyle(fontSize: 16, color: ktitleColor),
        ),
      ],
    ),
  );
}
