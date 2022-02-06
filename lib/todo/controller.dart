import 'model.dart';

class TodoController {
  List<TodoModel> todoList = [];

  void checkTask(int index) {
    todoList[index].finished = !todoList[index].finished;
  }

  void addTask(String title) {
    todoList.add(
      TodoModel(title: title),
    );
  }
}
