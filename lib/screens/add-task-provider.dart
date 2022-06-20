import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo-provider.dart';

class AddTaskProviderScreen extends StatefulWidget {
  AddTaskProviderScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskProviderScreen> createState() => _AddTaskProviderScreenState();
}

class _AddTaskProviderScreenState extends State<AddTaskProviderScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Description",
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false)
                    .addTask(_titleCtrl.text, _descCtrl.text);
              },
              child: const Text("Add Task"),
            )
          ],
        ),
      ),
    );
  }
}
