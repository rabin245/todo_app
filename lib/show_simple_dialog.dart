import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class ShowSimpleDialog extends StatelessWidget {
  ShowSimpleDialog({
    required this.title,
    required this.onPressed,
    required this.todoController,
  });

  final TextEditingController todoController;
  final String title;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(18),
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        TextField(
          controller: todoController,
          decoration: InputDecoration(hintText: 'Do 10 push ups'),
        ),
        OutlinedButton(
          child: Text('Update'),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
