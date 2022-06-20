import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo-provider.dart';

class RemoveTaskProviderScreen extends StatefulWidget {
  RemoveTaskProviderScreen({Key? key}) : super(key: key);

  @override
  State<RemoveTaskProviderScreen> createState() =>
      _RemoveTaskProviderScreenState();
}

class _RemoveTaskProviderScreenState extends State<RemoveTaskProviderScreen> {
  final TextEditingController _titleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remove Task"),
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
            ElevatedButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false).removeTask(
                  _titleCtrl.text,
                );
              },
              child: const Text("Remove task"),
            )
          ],
        ),
      ),
    );
  }
}
