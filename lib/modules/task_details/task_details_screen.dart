import 'package:flutter/material.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/shared/components/task_details_row_item/task_details_row_item.dart';
import 'package:tasks/shared/cubit/task_cubit.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskModel task;
  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  TaskCubit.getCubit(context).deleteTask(task.id!);
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 25.0, left: 25.0, right: 25.0, top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    task.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TaskDetailsRowItem(
                    icon: Icons.description_rounded,
                    text: task.description ?? 'Description',
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TaskDetailsRowItem(
                    icon: Icons.calendar_month_rounded,
                    text: task.date ?? 'Date',
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TaskDetailsRowItem(
                    icon: Icons.watch_later_rounded,
                    text: task.time ?? 'Time',
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      TaskCubit.getCubit(context).updateTask(task.id!, 1);
                      Navigator.pop(context);
                    },
                    child: const Text('Mark as complete'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
