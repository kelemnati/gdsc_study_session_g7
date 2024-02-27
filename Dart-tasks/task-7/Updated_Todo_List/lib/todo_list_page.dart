import 'package:flutter/material.dart';
import 'package:gdsc_1/form_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'task_detail.dart';
import 'data_page.dart';

// Import 'FormPage.dart' and 'DataPage.dart' for navigation and data management

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar with title and back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: const Center(
                  child: Text(
                    "Todo List",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.to(() => const FormPage(),
                        transition: Transition.fade,
                        duration: const Duration(seconds: 1));
                    // Navigate back to FormPage using Get
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red[400],
                    size: 40,
                  ),
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Image
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("resource/stickman.png"),
            ),
            const SizedBox(
              height: 5,
            ),
            // Tasks List title
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: Text(
                "Tasks List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            // List of tasks
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                constraints: const BoxConstraints(maxHeight: 320),
                child: ListView.builder(
                  itemCount: context.watch<DataClass>().user.length,
                  itemBuilder: (context, index) {
                    List<Map<String, dynamic>> user =
                        context.watch<DataClass>().user;
                    String mainTaskName = user[index]['mainTaskName'];
                    String description = user[index]['description'];
                    String dueDate = user[index]['dueDate'];
                    DateTime parsedDueDate = DateTime.parse(dueDate);
                    String formattedDueDate =
                        "${parsedDueDate.year}-${parsedDueDate.month}-${parsedDueDate.day}";
                    String firstLetter =
                        mainTaskName.isNotEmpty ? mainTaskName[0] : '';
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () {
                          String mainTaskName = user[index]['mainTaskName'];
                          String description = user[index]['description'];
                          String dueDate = user[index]['dueDate'];
                          DateTime parsedDueDate = DateTime.parse(dueDate);
                          String formattedDueDate =
                              "${parsedDueDate.year}-${parsedDueDate.month}-${parsedDueDate.day}";
                          Get.to(
                            () => AddTask(
                              mainTaskName: mainTaskName,
                              description: description,
                              dueDate: formattedDueDate,
                            ),
                          );
                        },
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            firstLetter,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(mainTaskName),
                        subtitle: Text(description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(formattedDueDate),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red[400]),
                              onPressed: () {
                                Provider.of<DataClass>(context, listen: false)
                                    .deleteTask(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Button to create new task
            Center(
              child: SizedBox(
                width: 300,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 224, 80, 78)),
                    child: const Text("Create Task"),
                    onPressed: () {
                      Get.toNamed("/createTask");
                      // Navigate to create task page using Get
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
