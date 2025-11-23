class Task {
  String title;
  String description;
  DateTime? dueDate;
  String priority;
  bool isCompleted;

  Task({
    required this.title,
    this.description = '',
    this.dueDate,
    this.priority = 'Low',
    this.isCompleted = false,
  });
}
