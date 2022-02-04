import 'package:flutter/material.dart';
import 'package:todo_app/todo/model.dart';

import 'controller.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoController controller = TodoController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.todoList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: CheckboxListTile(
              value: controller.todoList[index].finished,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                controller.todoList[index].title,
                style: const TextStyle(fontSize: 16),
              ),
              onChanged: (bool? select) {
                setState(() => controller.finishTodo(index));
              },
            ),
          );
        },
      ),
    );
  }
}
