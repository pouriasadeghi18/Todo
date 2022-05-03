import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Constants.dart';

import '../Models/todo_model.dart';
import 'Button.dart';

class AddTodoBody extends StatefulWidget {
  AddTodoBody({
    Key? key,
    required this.type,
    required this.Index,
    required this.Text,
  }) : super(key: key);
  final String type;
  final int Index;
  final String Text;

  @override
  State<AddTodoBody> createState() => _AddTodoBodyState();
}

class _AddTodoBodyState extends State<AddTodoBody> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.type == 'update') {
      controller.text = widget.Text;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.blue),
                ),
                hintText: "Please enter what you want to do",
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1))),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isEmpty) {
              } else {
                print(controller.text.length);
                OnButtonPressed(controller.text, widget.Index);
              }
            },
            child: Text(
              widget.type == 'add' ? "Add" : "Update",
              style: const TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPinkColor),
                fixedSize: MaterialStateProperty.all(const Size(100, 40))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Please Type in TextField"),
        ],
      ),
    );
  }

  void OnButtonPressed(String Text, int Index) {
    if (widget.type == 'add') {
      Add(Text);
    } else if (widget.type == 'update') {
      Update(Text, Index);
    }
  }

  ShowEptyTextField() {}
  Add(String Text) async {
    var box = await Hive.openBox('todo');
    Todo todo = Todo(Text);
    await box.add(todo);
    Navigator.pop(context);
  }

  Update(String Text, int Index) async {
    var box = await Hive.openBox('todo');
    Todo todo = Todo(Text);
    await box.putAt(Index, todo);
    Navigator.pop(context);
  }
}
