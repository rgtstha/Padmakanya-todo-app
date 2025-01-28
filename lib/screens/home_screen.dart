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
  List<TodoModel> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP"),
        actions: [
          IconButton(
            onPressed: () async {
              TodoModel? todo = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TodoAddScreen(),
                ),
              );

              if (todo != null) {
                setState(() {
                  items.add(todo);
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: items.isEmpty
          ? const Center(
              child: Text("No tasks added"),
            )
          : ListView.separated(
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
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text("Delete"),
                                onTap: () {
                                  Navigator.of(context).pop();

                                  setState(() {
                                    items.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        });
                  },
                );
              },
            ),
    );
  }
}
