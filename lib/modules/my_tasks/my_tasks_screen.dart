import 'package:flutter/material.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/shared/components/custom_task/custom_task.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomTask(
            task: TaskModel(
              id: 1,
              name: 'Task 1',
              date: 'October 9, 2024',
              completed: false,
              archived: false,
            ),
            onLeadingTab: () {},
            onTaskTab: () {},
            onTrailingTab: () {},
          ),
        ],
      ),
    );
  }
}
