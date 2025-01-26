import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/todo_elevated_button.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo Item"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Add item",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 100),
            TodoElevatedButton(
              text: "Add",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
