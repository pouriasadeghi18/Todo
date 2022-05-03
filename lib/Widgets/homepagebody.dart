import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Constants.dart';

import 'package:todo_app/Widgets/Category.dart';
import 'package:todo_app/screens/homepage.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Whats up! Porya",
                style: TextStyle(fontSize: 30, color: KTextTitleColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 16, color: ktitleColor),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      if (notification.direction == ScrollDirection.forward) {
                        setState(() {
                          print(notification.toString());
                        });
                      } else if (notification.direction ==
                          ScrollDirection.reverse) {
                        setState(() {
                          
                        });
                      }
                      return true;
                    },
                    child: Row(children: [
                      Category("Business", 40, 0.9),
                      Category("Work", 20, 0.5),
                      Category("Sport", 5, 0.4),
                      Category("Book", 2, 10),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Todays'Task",
                style: TextStyle(fontSize: 16, color: ktitleColor),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: Hive.openBox('todo'),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
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
        ),
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
