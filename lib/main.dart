import 'package:flutter/material.dart';
import 'package:todo_app/todo_app.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoNotifier>(
      create: (context) => TodoNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: TodoApp(),
      ),
    );
  }
}
