import 'package:flutter/material.dart';
import 'package:todo_app/Constants.dart';

FloatingActionButton HomeFloatingActionButton(VoidCallback OnTap) {
  return FloatingActionButton(
    onPressed: () {
      OnTap();
    },
    child: const Icon(
      Icons.add,
      color: Colors.white,
    ),
    backgroundColor: kPinkColor,
  );
}
