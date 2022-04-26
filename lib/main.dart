import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app/Constants.dart';
import 'package:todo_app/Models/todo_model.dart';

import 'package:todo_app/screens/addtodo.dart';
import 'package:todo_app/screens/homepage.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: kBackGroundColor),
      home: HomePage(),
    );
  }
}
