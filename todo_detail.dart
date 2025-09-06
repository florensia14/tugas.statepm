import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoDetailPage extends StatelessWidget {
  final ToDoItem todo;

  const TodoDetailPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Tugas",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFC75D91), // Ganti biru dengan ungu utama
        iconTheme: const IconThemeData(color: Colors.white), // panah back putih
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.taskText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  todo.isCompleted ? "Selesai ✅" : "Belum selesai ❌",
                  style: TextStyle(
                    fontSize: 16,
                    color: todo.isCompleted ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (todo.tags.isNotEmpty) ...[
              const Text(
                "Kategori:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6.0,
                runSpacing: 4.0,
                children: todo.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        backgroundColor: const Color(0xFFE9DDFE), // ungu muda konsisten
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
