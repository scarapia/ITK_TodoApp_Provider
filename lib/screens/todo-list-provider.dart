import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/custom-widgets/status-card-provider.dart';
import 'package:todo_app_provider/providers/todo-provider.dart';
import 'package:todo_app_provider/screens/add-task-provider.dart';
import 'package:todo_app_provider/screens/remove-task.dart';
import 'package:todo_app_provider/screens/update-task.dart';

class TodoListProviderScreen extends StatefulWidget {
  TodoListProviderScreen({Key? key}) : super(key: key);

  @override
  State<TodoListProviderScreen> createState() => _TodoListProviderScreenState();
}

class _TodoListProviderScreenState extends State<TodoListProviderScreen> {
  var tasksObj;
  CollectionReference tasksCollection =
      FirebaseFirestore.instance.collection("tasks");
  FirebaseFirestore _db = FirebaseFirestore.instance;

  getTasksInCollection() async {
    QuerySnapshot querySnapshotTasks = await tasksCollection.get();
    setState(() {
      tasksObj = querySnapshotTasks.docs.map((doc) => doc.data()).toList();
    });
    print(tasksObj);
  }

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasksInCollection();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Column(
        children: [
          StatusCardProvider(),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todo, child) {
                return ListView.builder(
                    itemCount: todo.tasks.length,
                    itemBuilder: (bc, index) {
                      return ListTile(
                        title: Text("${todo.tasks[index]['title']}"),
                        subtitle: Text("${todo.tasks[index]['description']}"),
                        trailing: IconButton(
                          icon: todo.tasks[index]['isCompleted']
                              ? Icon(Icons.check_box)
                              : Icon(Icons.check_box_outline_blank_outlined),
                          onPressed: () {
                            todo.tasks[index]['isCompleted']
                                ? todo.markAsIncomplete(index)
                                : todo.markAsCompleted(index);
                          },
                        ),
                      );
                    });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RemoveTaskProviderScreen(),
                    ),
                  );
                },
                child: const Text("Delete Task"),
              ),
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTaskProviderScreen(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateTaskScreen(),
                    ),
                  );
                },
                child: const Text("Update Task"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
