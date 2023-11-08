import 'package:transforms/tools/enum.dart';

class TaskLineModel {
  int id;
  int taskId;
  MaintenanceType type;
  String message;
  String? productName;
  double? quantity;

  TaskLineModel({
    required this.id,
    required this.taskId,
    required this.type,
    required this.message,
    this.productName,
    this.quantity,
  });
}