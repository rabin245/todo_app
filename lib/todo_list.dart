import 'package:flutter/material.dart';
import 'package:todo_app/show_simple_dialog.dart';
import 'package:todo_app/todo_notifier.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int todoListLength =
        context.watch<TodoNotifier>().currentTodos.length;
    if (todoListLength == 0) {
      return Center(
        child: Text(
          'No task left to do!😎😎😎',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black),
        ),
      );
    } else
      return ListView.builder(
        itemCount: todoListLength,
        itemBuilder: (BuildContext context, int index) {
          return Consumer<TodoNotifier>(
            builder: (context, todoNotifier, child) {
              var todo = todoNotifier.currentTodos[index];
              // var task = todoNotifier.currentTodos[index].task;
              // var isDone = todoNotifier.currentTodos[index].isDone;
              return CheckboxListTile(
                title: Text(
                  todo.task,
                  style: TextStyle(
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                value: todo.isDone,
                onChanged: (value) {
                  todoNotifier.updateTodoDone(todo);
                },
                controlAffinity: ListTileControlAffinity.leading,
                secondary: PopupMenuButton<Action>(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: Action.edit,
                        child: Text('Edit'),
                      ),
                      PopupMenuItem(
                        value: Action.delete,
                        child: Text('Delete'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    final todoController =
                        TextEditingController(text: todo.task);
                    switch (value) {
                      case Action.delete:
                        todoNotifier.deleteTodo(todo);
                        break;
                      case Action.edit:
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShowSimpleDialog(
                              title: 'Update Todo',
                              todoController: todoController,
                              onPressed: () {
                                todoNotifier.updateTodo(
                                  todoController.text,
                                  todo: todo,
                                );
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                        break;
                      default:
                    }
                  },
                ),
              );
            },
          );
        },
      );
  }
}

enum Action { edit, delete }
