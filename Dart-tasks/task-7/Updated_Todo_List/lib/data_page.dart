import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataClass extends ChangeNotifier {
  List<Map<String, dynamic>> user = [];

  Future<void> addTask(
      String mainTaskName, DateTime dueDate, String description) async {
    final Map<String, dynamic> task = {
      "mainTaskName": mainTaskName,
      "dueDate": dueDate.toString(),
      "description": description,
    };
    user.add(task);
    notifyListeners();
    await _saveTasksToPrefs();
  }

  DataClass() {
    _loadTasksFromPrefs();
  }

  Future<void> _loadTasksFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> decodedTasks = jsonDecode(tasksJson);
      user = decodedTasks.cast<Map<String, dynamic>>();
      notifyListeners();
    }
  }

  Future<void> _saveTasksToPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedTasks = jsonEncode(user);
    await prefs.setString('tasks', encodedTasks);
  }

  void updateTask(
      int index, String mainTaskName, DateTime dueDate, String description) {
    if (index >= 0 && index < user.length) {
      user[index] = {
        "mainTaskName": mainTaskName,
        "dueDate": dueDate.toString(),
        "description": description,
      };
      notifyListeners();
      _saveTasksToPrefs();
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < user.length) {
      user.removeAt(index);
      notifyListeners();
      _saveTasksToPrefs();
    }
  }

  List<String> getFirstLettersOfMainTaskNames() {
    List<String> firstLetters = [];
    for (Map<String, dynamic> task in user) {
      if (task['mainTaskName'] != null && task['mainTaskName'].isNotEmpty) {
        firstLetters.add(task['mainTaskName'][0]); // Extracting first letter
      }
    }
    return firstLetters;
  }
}
