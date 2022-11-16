import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_force/provider/task_force_provider.dart';
import 'package:task_force/screens/task_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController task_name = TextEditingController();
  final TextEditingController task_desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final task_provider = Provider.of<TaskForceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Force"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const TaskScreen()));
        },
        child: const Icon(Icons.remove_red_eye),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Task Name cannot be empty";
                        }
                        return null;
                      },
                      controller: task_name,
                      initialValue: null,
                      decoration: const InputDecoration(
                        label: Text("Task Name"),
                        hintText: "Enter Task Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description cannot be empty";
                        }
                        return null;
                      },
                      controller: task_desc,
                      maxLines: 5,
                      initialValue: null,
                      decoration: const InputDecoration(
                        label: Text("Task Description"),
                        hintText: "Enter Task Description",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: (() {
                        if (_formKey.currentState!.validate()) {
                          task_provider.addTask(task_name.text, task_desc.text);
                          clear();
                          aletBox("Save Successfully!");
                        }
                      }),
                      child: const Text("Save Task"),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void clear() {
    task_name.clear();
    task_desc.clear();
  }

  Future<void> aletBox(String info) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((BuildContext context) {
          return AlertDialog(
            title: const Text("Task Force"),
            content: Text(info),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        }));
  }
}
