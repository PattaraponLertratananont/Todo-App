import 'model.dart';

class TodoController {
  List<TodoModel> todoList = [
    for (var i = 0; i < 20; i++) TodoModel(title: "Title ${i.toString()}")
  ];

  void checkTask(int index) {
    todoList[index].finished = !todoList[index].finished;
  }
}
