import 'package:flutter/material.dart';
import 'package:todo_app/todo/controller.dart';

class TodoList extends StatefulWidget {
  final TodoController controller;
  const TodoList({Key? key, required this.controller}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.controller.todoList.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 26),
            title: Text(widget.controller.todoList[index].title),
            value: widget.controller.todoList[index].finished,
            selected: widget.controller.todoList[index].finished,
            selectedTileColor: Colors.grey[200],
            activeColor: Colors.pink[300],
            onChanged: (bool? checked) {
              setState(() {
                widget.controller.checkTask(index);
              });
            },
          );
        },
      ),
    );
  }
}
