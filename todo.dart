class ToDoItem {
  final String taskText;
  final List<String> tags;
  final String section;
  final bool showListIcon;
  bool isCompleted; // <-- Pastikan ini tidak final
  final String indicatorColor;

  ToDoItem({
    required this.taskText,
    this.tags = const [],
    required this.section,
    this.showListIcon = false,
    this.isCompleted = false,
    required this.indicatorColor,
  });
}