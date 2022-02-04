import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/todo/screen.dart';

import 'todo/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoController controller = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    color: Colors.lightBlue[600],
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => AddTodoModal(
                          onSave: (title) {
                            setState(() {
                              controller.addTodo(title: title);
                            });
                          },
                        ),
                        isScrollControlled: true,
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TodoListScreen(controller: controller),
          ],
        ),
      ),
    );
  }
}

class AddTodoModal extends StatelessWidget {
  final Function(String title) onSave;
  const AddTodoModal({Key? key, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text("Save"),
                onPressed: () {
                  onSave(titleController.text);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const Text(
            "Title",
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            controller: titleController,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
