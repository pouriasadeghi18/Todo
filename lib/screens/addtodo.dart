import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Models/todo_model.dart';
import 'package:todo_app/Widgets/addtodoappbar.dart';

import '../Widgets/addtodobody.dart';

class AddTodo extends StatefulWidget {
  AddTodo(
      {Key? key, required this.type, required this.Index, required this.Text})
      : super(key: key);
  final String type;
  final int Index;
  final String Text;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddTodoAppBar(() {
        Navigator.pop(context);
      }, widget.type),
      body: AddTodoBody(
        type: widget.type,
        Index: widget.Index,
        Text: widget.Text,
      ),
    );
  }
}
