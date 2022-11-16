import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_force/provider/task_force_provider.dart';
import 'package:task_force/screens/home_page.dart';

void main() {
  runApp(const TaskForce());
}

class TaskForce extends StatelessWidget {
  const TaskForce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskForceProvider())
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
