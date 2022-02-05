import 'package:flutter/material.dart';
import 'package:todo_app/todo/controller.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TodoController controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.todoList.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 26),
            title: Text(controller.todoList[index].title),
            value: controller.todoList[index].finished,
            selected: controller.todoList[index].finished,
            selectedTileColor: Colors.grey[200],
            activeColor: Colors.pink[300],
            onChanged: (bool? checked) {
              setState(() {
                controller.checkTask(index);
              });
            },
          );
        },
      ),
    );
  }
}
