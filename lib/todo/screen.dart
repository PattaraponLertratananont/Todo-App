import 'package:flutter/material.dart';

import 'controller.dart';

class TodoListScreen extends StatefulWidget {
  final TodoController controller;
  const TodoListScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.controller.todoList.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: widget.controller.todoList[index].finished,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            title: Text(
              widget.controller.todoList[index].title,
              style: const TextStyle(fontSize: 16),
            ),
            onChanged: (bool? select) {
              setState(() => widget.controller.finishTodo(index));
            },
          );
        },
      ),
    );
  }
}
