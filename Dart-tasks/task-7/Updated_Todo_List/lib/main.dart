import 'package:flutter/material.dart';
import 'package:gdsc_1/data_page.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'task_detail.dart';
import 'create_task_page.dart';
import 'home_page.dart';
import 'todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/todoList': (context) => const ToDoList(),
          '/createTask': (context) => const CreateTask(),
          '/addTask': (context) => const AddTask(
                mainTaskName: '',
                description: '',
                dueDate: '',
              ),
          '/homePage': (context) => const HomePage(),
        },
      ),
    );
  }
}
