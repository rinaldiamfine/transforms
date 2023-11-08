import 'package:transforms/models/user_model.dart';
import 'package:transforms/tools/enum.dart';

class  TaskArgument {
  final String title;
  final AccessType accessType;
  final int id;
  final UserModel userModel;

  TaskArgument({
    required this.title,
    required this.accessType,
    required this.id,
    required this.userModel
  });
}