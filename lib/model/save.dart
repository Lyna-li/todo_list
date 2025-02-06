import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';


class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Learn Flutter ❤️'),
    Task(title: 'Drink Water 💧'),
    Task(title: 'Play Football ⚽'),
    Task(title: 'Add More Todos'),
  ];

  List<Task> get tasks => _tasks;

 void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }
  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  
}