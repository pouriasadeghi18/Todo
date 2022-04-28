import 'package:flutter/material.dart';
import 'package:todo_app/Constants.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar HomeAppBar(GlobalKey<ScaffoldState> _scaffoldKey) {
  return AppBar(
    backgroundColor: kBackGroundColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      icon: const Icon(FontAwesomeIcons.barsStaggered),
      color: KGrayIconButton,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
              color: KGrayIconButton,
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.bell),
              color: KGrayIconButton,
            ),
          ],
        ),
      ),
    ],
  );
}
