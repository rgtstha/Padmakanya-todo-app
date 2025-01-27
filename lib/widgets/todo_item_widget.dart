import 'package:flutter/material.dart';
import 'package:flutter_form/models/todo_model.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    super.key,
    required this.todo,
    required this.onChanged,
  });

  final TodoModel todo;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      tileColor: Colors.lightGreen,
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
