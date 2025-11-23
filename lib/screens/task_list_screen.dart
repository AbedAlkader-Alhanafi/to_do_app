
import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });

    if (task.dueDate != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Reminder: ${task.title} is due on ${task.dueDate!.toLocal().toString().split(" ")[0]}'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void toggleComplete(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  int completedTasks() => tasks.where((t) => t.isCompleted).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskFlow'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Completed ${completedTasks()} of ${tasks.length} tasks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? Center(
                    child: Text(
                      'No tasks added yet!',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.all(12),
                    itemCount: tasks.length,
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          leading: Checkbox(
                            value: task.isCompleted,
                            onChanged: (_) => toggleComplete(index),
                          ),
                          title: Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (task.description.isNotEmpty)
                                Text(task.description),
                              if (task.dueDate != null)
                                Text(
                                  'Due: ${task.dueDate!.toLocal().toString().split(" ")[0]}',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 13),
                                ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Edit button
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blueAccent),
                                onPressed: () async {
                                  final updatedTask = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => AddTaskScreen(
                                        task: task,
                                      ),
                                    ),
                                  );
                                  if (updatedTask != null) {
                                    setState(() {
                                      tasks[index] = updatedTask;
                                    });
                                  }
                                },
                              ),
                              Chip(
                                label: Text(
                                  task.priority,
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor:
                                    getPriorityColor(task.priority),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete,
                                    color: Colors.grey[700]),
                                onPressed: () => deleteTask(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
          if (newTask != null) addTask(newTask);
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
