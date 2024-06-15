import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/shared/components/custom_list_view/custom_list_view.dart';
import 'package:tasks/shared/cubit/task_cubit.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        //List<TaskModel> myTasks = TaskCubit.getCubit(context).myTasks;
        return state is TaskFetch
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomListView(
                  tasks: TaskCubit.getCubit(context).archivedTasks,
                  onLeadingTab: (index) {
                    TaskCubit.getCubit(context).updateTask(
                        TaskCubit.getCubit(context).archivedTasks[index].id!,
                        1);
                  },
                  onTrailingTab: (index) {
                    TaskCubit.getCubit(context).updateTask(
                        TaskCubit.getCubit(context).archivedTasks[index].id!,
                        0);
                  },
                ),
              );
      },
    );
  }
}
