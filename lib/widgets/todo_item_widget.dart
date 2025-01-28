import 'package:flutter/material.dart';
import 'package:flutter_form/models/todo_model.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.onTap,
  });

  final TodoModel todo;
  final void Function(bool?)? onChanged;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(todo.title),
      tileColor: Colors.lightGreen,
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
