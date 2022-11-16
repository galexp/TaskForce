import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_force/model/task_force_model.dart';

import '../provider/task_force_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final task_provider = Provider.of<TaskForceProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: task_provider.taskList.length,
          itemBuilder: (context, index) {
            TaskForceModel model = task_provider.taskList[index];
            // print(model.taskName);

            return Slidable(
              child: ListTile(
                title: Text(model.taskName),
                subtitle: Text(model.taskDesc),
              ),
            );
          }),
    );
  }
}
