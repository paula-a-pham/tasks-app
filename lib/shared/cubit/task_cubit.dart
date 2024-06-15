import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/shared/database/database_helper.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  List<TaskModel> myTasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> archivedTasks = [];

  static TaskCubit getCubit(context) => BlocProvider.of(context);

  void getTasks() {
    emit(TaskFetch());
    myTasks = [];
    completedTasks = [];
    archivedTasks = [];
    DatabaseHelper.getTasksList(0).then(
      (value) {
        myTasks = value;
      },
    ).then(
      (value) {
        DatabaseHelper.getTasksList(1).then(
          (value) {
            completedTasks = value;
          },
        ).then(
          (value) {
            DatabaseHelper.getTasksList(2).then(
              (value) {
                archivedTasks = value;
              },
            ).then(
              (value) {
                emit(TaskReload());
              },
            );
          },
        );
      },
    );
  }

  void insertTask(TaskModel task) {
    DatabaseHelper.insertNewTask(task).then(
      (value) {
        emit(
          TaskInserted(),
        );
        getTasks();
      },
    );
  }
}
