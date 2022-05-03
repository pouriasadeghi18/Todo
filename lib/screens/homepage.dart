import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/homeappbar.dart';
import 'package:todo_app/Widgets/homefloatingactionbutton.dart';
import 'package:todo_app/Widgets/homepagebody.dart';
import 'package:todo_app/screens/addtodo.dart';

import '../Widgets/navigationdrawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  bool isFabVisible = true;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: HomeAppBar(_scaffoldKey),
        drawer: const NavigationDrawer(),
        body: HomePageBody(),
        floatingActionButton: widget.isFabVisible
            ? HomeFloatingActionButton(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTodo(
                              type: 'add',
                              Index: -1,
                              Text: "",
                            )));
              })
            : null);
  }
}
