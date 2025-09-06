// lib/providers/todo_provider.dart

import 'package:flutter/material.dart';
import '../models/todo.dart';

class ToDoProvider with ChangeNotifier {
  final List<ToDoItem> _items = [
    // Tambahkan item dummy untuk contoh
    ToDoItem(taskText: 'Move drafts in Figma', section: 'My awesome app', indicatorColor: 'red', tags: ['admin', 'low-energy', 'quick']),
    ToDoItem(taskText: 'Create a first draft for pricing', section: 'My awesome app', indicatorColor: 'yellow', tags: ['design', 'personal', '2h']),
    ToDoItem(taskText: 'Check a letter from a test user', section: 'My awesome app', indicatorColor: 'yellow', tags: []),
    ToDoItem(taskText: 'Buy tablets for dishwasher', section: 'Home', indicatorColor: 'yellow', tags: []),
    ToDoItem(taskText: 'Clean up windows', section: 'Home', indicatorColor: 'green', tags: ['frog', '3h']),
    ToDoItem(taskText: 'Groceries', section: 'Home', indicatorColor: 'green', tags: []),
    ToDoItem(taskText: 'Replace battery in clock (kitchen)', section: 'Home', indicatorColor: 'grey', tags: []),
  ];

  List<ToDoItem> get items => _items;

  void addItem(ToDoItem item) {
    _items.add(item);
    notifyListeners();
  }

  // UBAH FUNGSI removeItem DI SINI
  void removeItem(ToDoItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void toggleCompletion(ToDoItem item) {
    item.isCompleted = !item.isCompleted;
    notifyListeners();
  }
}