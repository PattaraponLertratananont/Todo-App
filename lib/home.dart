import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'todo/controller.dart';
import 'todo/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TodoController controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat("d MMMM yyyy").format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                    onPressed: showModalAddTodo,
                  )
                ],
              ),
            ),
            TodoList(controller: controller),
          ],
        ),
      ),
    );
  }

  Future<void> showModalAddTodo() async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                child: const Text("Save"),
                onPressed: () {
                  setState(() {
                    controller.addTask(titleController.text);
                  });
                  titleController.clear(); // clear text controller
                  Navigator.pop(context); // close modal bottom sheet
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(controller: titleController),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
