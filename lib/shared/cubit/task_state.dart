part of 'task_cubit.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskFetch extends TaskState {}

final class TaskReload extends TaskState {}

final class TaskInserted extends TaskState {}

final class TaskUpdated extends TaskState {}
