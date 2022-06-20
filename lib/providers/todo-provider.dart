import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TodoProvider extends ChangeNotifier {
  var tasks = [];

  FirebaseFirestore _db = FirebaseFirestore.instance;

  addTask(title, description) {
    //insert to firestore
    tasks.add({
      FirebaseFirestore.instance.collection("tasks").doc(title).set({
        "title": title,
        "description": description,
        "isCompleted": false,
        "createdAt": FieldValue.serverTimestamp()
      })
    });
    //false by default
    notifyListeners();
  }

  removeTask(title) {
    tasks.remove(
        {FirebaseFirestore.instance.collection("tasks").doc(title).delete()});
    notifyListeners();
  }

  updateTask(title, description) {
    FirebaseFirestore.instance.collection("tasks").doc(title).update({
      "title": title,
      "description": description,
      //"createdAt": createdAt,
    });
  }

  getTaskCount() {
    _db.collection("tasks").snapshots().listen((event) {
      var _tmp = [];
      event.docs.forEach((tasks) {
        _tmp.add({"title": tasks.data()});
      });
      tasks = _tmp;
    });

    return tasks.length;
  }

  getCompletedTaskCount() {
    var completedTasks = tasks.where((task) => task["isCompleted"] == true);
    return completedTasks.length;
  }

  markAsCompleted(index) {
    tasks[index]['isCompleted'] = true;
    notifyListeners();
  }

  markAsIncomplete(index) {
    tasks[index]['isCompleted'] = false;
    notifyListeners();
  }
}
