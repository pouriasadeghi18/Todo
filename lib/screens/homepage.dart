import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/homeappbar.dart';
import 'package:todo_app/Widgets/homefloatingactionbutton.dart';
import 'package:todo_app/Widgets/homepagebody.dart';
import 'package:todo_app/screens/addtodo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: HomePageBody(),
      floatingActionButton: HomeFloatingActionButton(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTodo(
                      type: 'add',
                      Index: -1,
                      Text: "",
                    )));
      }),
    );
  }
}
