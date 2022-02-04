import 'package:flutter/material.dart';
import 'package:todo_app/todo/model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoModel> todoList = [
    for (var i = 0; i < 20; i++) TodoModel(title: "Wowza $i", finished: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: CheckboxListTile(
              value: todoList[index].finished,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                todoList[index].title,
                style: const TextStyle(fontSize: 16),
              ),
              onChanged: (bool? select) {},
            ),
          );
        },
      ),
    );
  }
}
