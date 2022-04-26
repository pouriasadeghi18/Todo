import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Constants.dart';

import '../Models/todo_model.dart';
import '../screens/addtodo.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height * 0.75);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Whats up! Olivia",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Todays'Task",
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 189, 186, 186)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                      future: Hive.openBox('todo'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          return todolist();
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget todolist() {
  Box todobox = Hive.box('todo');
  return ValueListenableBuilder(
    valueListenable: todobox.listenable(),
    builder: (BuildContext context, Box box, Widget? child) {
      if (box.values.isEmpty) {
        return const Center(child: Text("No Data!"));
      } else {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: todobox.length,
          itemBuilder: (BuildContext context, int index) {
            final Todo todo = box.getAt(index);
            return HomeCard(todo.Text, context, index, todo.Text);
          },
        );
      }
    },
  );
}

GestureDetector HomeCard(String text, context, int Index, String ContentText) {
  return GestureDetector(
      onTap: () {
        MyNavigator(context, Index, ContentText);
      },
      child: Card(
        borderOnForeground: true,
        color: kDarkBlueColor,
        child: ListTile(
          leading: const Icon(Icons.check_circle),
          title: Text(
            text,
            style: const TextStyle(),
          ),
          trailing: IconButton(
            onPressed: () {
              Remove(Index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ));
}

void Remove(int index) {
  Box box = Hive.box('todo');
  box.deleteAt(index);
}

MyNavigator(context, int Index, String Text) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddTodo(
                type: 'update',
                Index: Index,
                Text: Text,
              )));
}
