// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final int id;
  final String name;
  final String? description;
  final String? date;
  final String? time;
  final bool completed;
  final bool archived;
  TaskModel({
    required this.id,
    required this.name,
    this.description,
    this.date,
    this.time,
    required this.completed,
    required this.archived,
  });
}
