
import 'package:flutter/material.dart';
import 'package:tasks/models/task_model/task_model.dart';

class CustomTask extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onLeadingTab;
  final VoidCallback onTaskTab;
  final VoidCallback onTrailingTab;
  const CustomTask({
    super.key,
    required this.task,
    required this.onLeadingTab,
    required this.onTaskTab,
    required this.onTrailingTab,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: onLeadingTab,
          child: Icon(
            task.completed ? Icons.task_alt_rounded : Icons.circle_outlined,
            color: task.completed ? Colors.green.shade600 : null,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTaskTab,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  task.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                    decoration: task.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.completed ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  task.date!,
                  style: TextStyle(
                    color: task.completed ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: onTrailingTab,
          child: Icon(
            task.completed ? null : Icons.archive_rounded,
          ),
        ),
      ],
    );
  }
}
