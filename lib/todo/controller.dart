import 'model.dart';

class TodoController {
  List<TodoModel> todoList = [
    for (var i = 0; i < 20; i++) TodoModel(title: "Wowza $i", finished: false),
  ];

  void finishTodo(int index) {
    todoList[index].finished = !todoList[index].finished;
  }
}
