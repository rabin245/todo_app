import 'package:flutter/material.dart';
import 'package:todo_app/show_simple_dialog.dart';
import 'package:todo_app/todo_notifier.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo.dart';

class TodoEntryDialog extends StatelessWidget {
  const TodoEntryDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.white,
      onPressed: () {
        final todoController = TextEditingController();
        showDialog(
            context: context,
            // builder: (context) => SimpleDialog(
            //   contentPadding: EdgeInsets.all(18),
            //   children: [
            //     Text(
            //       'Add Todo',
            //       style: Theme.of(context).textTheme.headline5,
            //     ),
            //     TextField(
            //       controller: todoController,
            //       autofocus: true,
            //       decoration: InputDecoration(hintText: 'Do 10 push ups'),
            //     ),
            //     OutlinedButton(
            //       child: Text('Add'),
            //       onPressed: () {
            //         context
            //             .read<TodoNotifier>()
            //             .addTodo(Todo(task: todoController.text));
            //         Navigator.of(context).pop();
            //       },
            //     ),
            //   ],
            // ),
            builder: (context) => ShowSimpleDialog(
                title: 'Add Todo',
                onPressed: () {
                  context
                      .read<TodoNotifier>()
                      .addTodo(Todo(task: todoController.text));
                  Navigator.of(context).pop();
                },
                todoController: todoController));
      },
      child: Icon(Icons.edit),
    );
  }
}
