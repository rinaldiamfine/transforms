import 'package:transforms/models/task_line_model.dart';
import 'package:transforms/tools/enum.dart';

class  TaskReasonArgument {
  final String title;
  final MaintenanceType type;
  final TaskLineModel model;

  TaskReasonArgument({
    required this.title,
    required this.type,
    required this.model
  });
}