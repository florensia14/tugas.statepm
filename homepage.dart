// lib/screens/homepage.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';
import 'todo_detail.dart'; // import halaman detail

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final _tagController = TextEditingController();
  String? _taskErrorText;
  String? _tagErrorText;

  @override
  void dispose() {
    _textController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _addTask(String section) {
    setState(() {
      _taskErrorText = null;
      _tagErrorText = null;
    });

    if (_textController.text.isEmpty) {
      setState(() {
        _taskErrorText = 'Judul harus diisi';
      });
      return;
    }

    final List<String> tags = _tagController.text
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toList();

    final newItem = ToDoItem(
      taskText: _textController.text,
      section: section,
      indicatorColor: 'grey',
      tags: tags,
    );
    Provider.of<ToDoProvider>(context, listen: false).addItem(newItem);
    _textController.clear();
    _tagController.clear();
    Navigator.of(context).pop();
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 87, 110, 134),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline_sharp,
                color: Color(0xFF1976D2)),
            onPressed: () {
              _textController.clear();
              _tagController.clear();
              setState(() {
                _taskErrorText = null;
                _tagErrorText = null;
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (context, setDialogState) {
                      return AlertDialog(
                        title: Text("Add a new task in '$title'"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                labelText: 'Judul',
                                hintText: 'Masukkan judul tugas',
                                errorText: _taskErrorText,
                              ),
                              onChanged: (value) {
                                setDialogState(() {
                                  _taskErrorText = null;
                                });
                              },
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: _tagController,
                              decoration: InputDecoration(
                                labelText: 'Kategori (pisahkan dengan koma)',
                                hintText: 'mis: design, personal, 2h',
                                errorText: _tagErrorText,
                              ),
                              onChanged: (value) {
                                setDialogState(() {
                                  _tagErrorText = null;
                                });
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              _textController.clear();
                              _tagController.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Tambah'),
                            onPressed: () {
                              setDialogState(() {
                                _taskErrorText = _textController.text.isEmpty
                                    ? 'Judul harus diisi'
                                    : null;
                              });

                              if (_textController.text.isNotEmpty) {
                                _addTask(title);
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToDoItem(BuildContext context, ToDoItem item, Color color) {
    Color indicatorColor;
    switch (item.indicatorColor) {
      case 'red':
        indicatorColor = const Color(0xFFEF5350);
        break;
      case 'yellow':
        indicatorColor = const Color(0xFFE6BE61);
        break;
      case 'green':
        indicatorColor = const Color(0xFF66BB6A);
        break;
      case 'grey':
        indicatorColor = const Color(0xFF90A4AE);
        break;
      default:
        indicatorColor = Colors.transparent;
    }

    final todoProvider = Provider.of<ToDoProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoDetailPage(todo: item),
          ),
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.only(bottom: 12),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  todoProvider.toggleCompletion(item);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: item.isCompleted ? Colors.blue : Colors.black54,
                        width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: item.isCompleted
                      ? const Icon(Icons.check, size: 16, color: Colors.blue)
                      : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.taskText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        decoration: item.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    if (item.tags.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Wrap(
                          spacing: 6.0,
                          runSpacing: 4.0,
                          children:
                              item.tags.map((tag) => _buildTag(tag)).toList(),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  todoProvider.removeItem(todoProvider.items.indexOf(item));
                },
                child: const Icon(Icons.delete, color: Colors.red, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String tagText) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        tagText,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDoProvider>(context);
    final Map<String, List<ToDoItem>> sections = {};
    for (var item in todoProvider.items) {
      if (!sections.containsKey(item.section)) {
        sections[item.section] = [];
      }
      sections[item.section]!.add(item);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today',
              style: TextStyle(
                color: Color(0xFFC75D91),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Friday, June 7',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...sections.keys.map((section) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(section),
                    ...sections[section]!.map((item) {
                      return _buildToDoItem(
                        context,
                        item,
                        section == 'My awesome app'
                            ? const Color(0xFFE9DDFE)
                            : const Color(0xFFD6F3FE),
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
