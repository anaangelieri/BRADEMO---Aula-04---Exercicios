import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  const TaskCard({required this.task, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(task.title),
        trailing: Checkbox(
          value: task.completed,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
