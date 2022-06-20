import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo-provider.dart';

class StatusCardProvider extends StatelessWidget {
  const StatusCardProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("Total"),
                const SizedBox(height: 8),
                Text(
                  Provider.of<TodoProvider>(context)
                      .getTaskCount()
                      .toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text("Completed"),
                const SizedBox(height: 8),
               Text(
                  Provider.of<TodoProvider>(context)
                      .getCompletedTaskCount()
                      .toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
