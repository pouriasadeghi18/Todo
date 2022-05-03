import 'package:flutter/material.dart';
import 'package:todo_app/Constants.dart';

Widget Category(String CategoryName, int howmanytasks, double progress) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: new EdgeInsets.symmetric(horizontal: 10.0),
    width: 220,
    height: 120,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${howmanytasks.toString()} Task",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              color: ktitleColor,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            CategoryName,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: LinearProgressIndicator(
            value: progress,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        )
      ],
    ),
  );
}
