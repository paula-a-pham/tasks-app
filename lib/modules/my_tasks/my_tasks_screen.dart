import 'package:flutter/material.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/shared/components/custom_list_view/custom_list_view.dart';

class MyTasksScreen extends StatelessWidget {
  final List<TaskModel> _tasks = [];

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
