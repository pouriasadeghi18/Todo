import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/Constants.dart';

AppBar AddTodoAppBar(VoidCallback OnPressed, String type) {
  return AppBar(
      backgroundColor: kBackGroundColor,
      elevation: 0,
      title: Text(
        type == 'add' ? "Add Todo" : "Update Todo",
        style: const TextStyle(color: Colors.blueAccent),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          OnPressed();
        },
        color: Colors.blueAccent,
      ));
}
