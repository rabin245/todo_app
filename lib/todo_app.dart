import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_entry_dialog.dart';
import 'package:todo_app/todo_list.dart';
import 'package:todo_app/todo_notifier.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      body: TodoList(),
      floatingActionButton: TodoEntryDialog(),
    );
  }
}
