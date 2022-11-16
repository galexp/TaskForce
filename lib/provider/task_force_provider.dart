import 'package:flutter/cupertino.dart';
import 'package:task_force/model/task_force_model.dart';

class TaskForceProvider with ChangeNotifier {
  final List taskList = [];
  List get _taskList => taskList;

  void addTask(String taskName, String taskDesc) {
    taskList.add(TaskForceModel(
        taskName: taskName, taskDesc: taskDesc, isCompleted: false));
    notifyListeners();
  }
}
