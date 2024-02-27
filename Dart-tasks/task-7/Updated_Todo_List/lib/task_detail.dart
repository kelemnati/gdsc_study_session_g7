import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final String mainTaskName;
  final String description;
  final String dueDate;

  const AddTask({
    super.key,
    required this.mainTaskName,
    required this.description,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: const Center(
                  child: Text(
                    "Task Detail",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/todoList");
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
            const SizedBox(height: 5),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("resource/checklist.png"),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 240, 233, 233),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(mainTaskName),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 240, 233, 233),
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(description),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deadline",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 240, 233, 233),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(dueDate),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
