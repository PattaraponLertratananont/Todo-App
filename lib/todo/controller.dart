import 'model.dart';

class TodoController {
  List<TodoModel> todoList = [];

  void finishTodo(int index) {
    todoList[index].finished = !todoList[index].finished;
  }

  void addTodo({required String title}) {
    todoList.add(TodoModel(title: title, finished: false));
  }
}
