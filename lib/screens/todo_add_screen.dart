import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form/models/todo_model.dart';
import 'package:flutter_form/widgets/todo_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  final TextEditingController _todoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo Item"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _todoController,
                decoration: const InputDecoration(
                  hintText: "Add item",
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 100),
              TodoElevatedButton(
                text: "Add",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String todoText = _todoController.text;

                    TodoModel todo = TodoModel(
                      title: todoText,
                      isCompleted: false,
                    );

                    Map<String, dynamic> todoMap = todo.toJson();
                    String encodedTodo = jsonEncode(todoMap);

                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    List<String>? existingTodos = prefs.getStringList('todos');

                    if (existingTodos != null) {
                      existingTodos.add(encodedTodo);
                      prefs.setStringList('todos', existingTodos);
                    } else {
                      await prefs.setStringList('todos', [encodedTodo]);
                    }

                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }

                    // prefs.setSt
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
