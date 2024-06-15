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
            task.status == 1 ? Icons.task_alt_rounded : Icons.circle_outlined,
            color: task.status == 1 ? Colors.green.shade600 : null,
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
                    decoration: task.status == 1
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.status == 1 ? Colors.grey : Colors.black,
                  ),
                ),
                Visibility(
                  visible: task.date != null ? true : false,
                  child: Text(
                    task.date ?? '',
                    style: TextStyle(
                      color: task.status == 1 ? Colors.grey : Colors.black,
                    ),
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
            task.status == 1 ? null : Icons.archive_rounded,
          ),
        ),
      ],
    );
  }
}
