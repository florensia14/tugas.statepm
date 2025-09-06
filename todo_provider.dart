import 'package:flutter/material.dart';
import '../models/todo.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDoItem> _items = [
    // Data awal tetap sama seperti sebelumnya
    ToDoItem(
      taskText: 'Move drafts in Figma',
      tags: ['admin', 'low-energy', 'quick'],
      section: 'My awesome app',
      indicatorColor: 'red',
    ),
    // ... item lainnya
    ToDoItem(
      taskText: 'Create a first draft for pricing',
      tags: ['design', 'personal', '2h'],
      section: 'My awesome app',
      showListIcon: true,
      indicatorColor: 'yellow',
    ),
    ToDoItem(
      taskText: 'Check a letter from a test user',
      section: 'My awesome app',
      indicatorColor: 'yellow',
    ),
    ToDoItem(
      taskText: 'Buy tablets for dishwasher',
      section: 'Home',
      indicatorColor: 'yellow',
    ),
    ToDoItem(
      taskText: 'Clean up windows',
      tags: ['frog', '3h'],
      section: 'Home',
      indicatorColor: 'green',
    ),
    ToDoItem(
      taskText: 'Groceries',
      section: 'Home',
      showListIcon: true,
      indicatorColor: 'green',
    ),
    ToDoItem(
      taskText: 'Replace battery in clock (kitchen)',
      section: 'Home',
      indicatorColor: 'grey',
    ),
  ];

  List<ToDoItem> get items => _items;

  // Fungsi untuk menambahkan item baru
  void addItem(ToDoItem item) {
    _items.add(item);
    notifyListeners();
  }

  // Fungsi untuk menghapus item berdasarkan indeks
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  // Fungsi untuk mengubah status centang
  void toggleCompletion(ToDoItem item) {
    item.isCompleted = !item.isCompleted;
    notifyListeners();
  }
}