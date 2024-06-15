import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final int? id;
  final String name;
  final String? description;
  final String? date;
  final String? time;
  final int status;
  TaskModel({
    this.id,
    required this.name,
    this.description,
    this.date,
    this.time,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      status: map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
