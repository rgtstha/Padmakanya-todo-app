import 'package:flutter/material.dart';
import 'package:flutter_form/models/todo_model.dart';
import 'package:flutter_form/screens/todo_add_screen.dart';
import 'package:flutter_form/widgets/todo_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> items = [
    TodoModel(
      title: "Todo item 1",
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP"),
        actions: [
          IconButton(
            onPressed: () async {
              TodoModel todo = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TodoAddScreen(),
                ),
              );

              setState(() {
                items.add(todo);
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: items.length,
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (BuildContext context, int index) {
          TodoModel item = items[index];

          return TodoItemWidget(
            todo: item,
            onChanged: (bool? value) {
              // if value is null then no operations are
              // required. So, we immediately return if value
              // is null.
              if (value == null) return;

              // Now, first find the item to change it's status.
              final foundItem = items.firstWhere((todo) {
                return todo.title == item.title;
              });

              // Find the item index
              final foundItemIndex = items.indexOf(foundItem);

              TodoModel editedItem = TodoModel(
                title: foundItem.title,
                isCompleted: value,
              );

              setState(() {
                items[foundItemIndex] = editedItem;
              });
            },
          );
        },
      ),
    );
  }
}
