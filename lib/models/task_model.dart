import 'package:transforms/tools/enum.dart';

class TaskModel {
  int id;
  String title;
  String subtitle;
  String message;
  MaintenanceType type;
  DateTime dateTimeStarted;
  DateTime dateTimeFinished;

  TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.message,
    required this.type,
    required this.dateTimeStarted,
    required this.dateTimeFinished,
  });

}