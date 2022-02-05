import 'package:flutter/material.dart';

import 'model.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoModel> todoList = [
    for (var i = 0; i < 20; i++) TodoModel(title: "Title ${i.toString()}")
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(todoList[index].title),
            value: todoList[index].finished,
            onChanged: (bool? checked) {},
          );
        },
      ),
    );
  }
}
