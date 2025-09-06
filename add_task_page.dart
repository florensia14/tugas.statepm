import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _textController = TextEditingController();
  String _selectedSection = 'My awesome app';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTask() {
    if (_textController.text.isNotEmpty) {
      final newItem = ToDoItem(
        taskText: _textController.text,
        section: _selectedSection,
        indicatorColor: 'grey', // Default color
      );
      Provider.of<ToDoProvider>(context, listen: false).addItem(newItem);
      Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedSection,
              items: const [
                DropdownMenuItem(
                  value: 'My awesome app ',
                  child: Text('My awesome app'),
                ),
                DropdownMenuItem(
                  value: 'Home',
                  child: Text('Home'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedSection = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Section',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTask,
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}