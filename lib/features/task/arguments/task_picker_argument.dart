import 'package:transforms/models/picker_model.dart';
import 'package:transforms/tools/enum.dart';

class  TaskPickerArgument {
  final String title;
  final PickerModel model;
  final PickerType type;

  TaskPickerArgument({
    required this.title,
    required this.model,
    required this.type
  });
}