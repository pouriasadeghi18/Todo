import 'package:flutter/material.dart';
import 'package:todo_app/Constants.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar HomeAppBar() {
  return AppBar(
    backgroundColor: kBackGroundColor,
    elevation: 0,
    leading: const Icon(
      Icons.menu,
      color: Colors.white,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            GestureDetector(
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                FontAwesomeIcons.bell,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
