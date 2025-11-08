import 'package:hive_flutter/hive_flutter.dart';
 // needed for Hive code generation

@HiveType(typeId: 0)
class TaskModelHive extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  bool isSkipped;

  // Additional fields and constructor can be added here

  TaskModelHive({
    required this.id,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.isSkipped,
  });
}



class TaskModel {
int id;
DateTime createdAt;
String task;
String? description;
DateTime date;
String time;
bool completed;
  // Add this field

  TaskModel({
    required this.id,
    required this.createdAt,
    required this.task,
    this.description,
    required this.date,
    required this.time,
    this.completed = false, // Default value, adjust if needed
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        task: json['Task'] as String,
        description: json['Description'] as String?,
        date: DateTime.parse(json['Date'] as String),
        time: json['Time'] as String,
        completed: json['Completed'] as bool? ?? false, // Parse safely
      );

  Map<String, dynamic> toJson() => {
        'created_at': createdAt.toIso8601String(),
        'Task': task,
        'Description': description,
        'Date': date.toIso8601String(),
        'Time': time,
        'Completed': completed,
      };
}
