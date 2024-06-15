import 'package:flutter/material.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/modules/task_details/task_details_screen.dart';
import 'package:tasks/shared/components/custom_task/custom_task.dart';

class CustomListView extends StatelessWidget {
  final List<TaskModel> _tasks;
  final Function(int index) onLeadingTab;
  final Function(int index) onTrailingTab;
  const CustomListView({
    super.key,
    required List<TaskModel> tasks,
    required this.onLeadingTab,
    required this.onTrailingTab,
  }) : _tasks = tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => CustomTask(
              task: _tasks[index],
              onLeadingTab: () {
                onLeadingTab(index);
              },
              onTaskTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TaskDetailsScreen(task: _tasks[index]),
                  ),
                );
              },
              onTrailingTab: () {
                onTrailingTab(index);
              },
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 25,
            ),
        itemCount: _tasks.length);
  }
}
