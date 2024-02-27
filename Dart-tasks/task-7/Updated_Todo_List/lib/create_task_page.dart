import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_page.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mainTaskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  // Function to select date from date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _mainTaskNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                // Back button to navigate to previous page
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
            const Center(
              child: Text(
                "Create New Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Text form field for main task name input
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 40, right: 20),
                      child: TextFormField(
                        controller: _mainTaskNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter main task name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter main task name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Text form field for selecting due date
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: _selectedDate == null
                                  ? "Select due date"
                                  : "${_selectedDate!.toLocal()}".split(' ')[0],
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            validator: (value) {
                              if (_selectedDate == null) {
                                return 'Please select due date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Text form field for description input
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter description",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Button to add task
            Padding(
              padding: const EdgeInsets.all(80),
              child: Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final String mainTaskName =
                            _mainTaskNameController.text;
                        final String description = _descriptionController.text;
                        if (_selectedDate != null) {
                          context.read<DataClass>().addTask(
                              mainTaskName, _selectedDate!, description);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Task added successfully'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          // Clear text fields after adding task
                          _mainTaskNameController.clear();
                          _descriptionController.clear();
                          setState(() {
                            _selectedDate = null;
                          });
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red[400]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Add task"),
                    ),
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
