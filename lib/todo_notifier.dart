import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class TodoNotifier extends ChangeNotifier {
  List<Todo> currentTodos = [
    /// Todo(task: 'Finish all 10 apps'),
    /// Todo(task: 'Exercise'),
  ];

  void addTodo(Todo todo) {
    currentTodos.add(todo);
    notifyListeners();
  }

  void updateTodoDone(Todo todo) {
    final index = currentTodos.indexOf(todo);
    final isDone = currentTodos.elementAt(index).isDone;
    currentTodos.elementAt(index).isDone = !isDone;
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    currentTodos.remove(todo);
    notifyListeners();
  }

  void updateTodo(String updatedTask, {required Todo todo}) {
    final index = currentTodos.indexOf(todo);
    currentTodos.elementAt(index).task = updatedTask;
    notifyListeners();
  }
}
