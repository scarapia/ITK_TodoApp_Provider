import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo-provider.dart';


class UpdateTaskScreen extends StatefulWidget {
  UpdateTaskScreen({Key? key}) : super(key: key);

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();
  final TextEditingController _createAtCtrl = TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
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
            TextField(
              controller: _createAtCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "CreatedAt",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false)
                    .updateTask(_titleCtrl.text,_descCtrl,);
              },
              child: const Text("Update task"),
            )
          ],
        ),
      ),
    );
  }
}