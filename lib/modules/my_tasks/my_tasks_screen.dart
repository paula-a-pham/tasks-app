import 'package:flutter/material.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/shared/components/custom_list_view/custom_list_view.dart';

class MyTasksScreen extends StatelessWidget {
  final List<TaskModel> _tasks = [
    TaskModel(
        id: 1,
        name: 'Task 1',
        date: 'October 9, 2024',
        completed: false,
        archived: false),
    TaskModel(
        id: 2,
        name: 'Task 2',
        date: 'October 9, 2024',
        completed: false,
        archived: false),
    TaskModel(
        id: 3,
        name: 'Task 3',
        date: 'October 9, 2024',
        completed: false,
        archived: false),
    TaskModel(
        id: 4,
        name: 'Task 4',
        date: 'October 9, 2024',
        completed: false,
        archived: false),
  ];

  MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: CustomListView(
        tasks: _tasks,
        onLeadingTab: (index) {},
        onTrailingTab: (index) {},
      ),
    );
  }
}
