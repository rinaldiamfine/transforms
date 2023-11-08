import 'package:flutter/material.dart';
import 'package:transforms/models/task_model.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';

class TaskCardWidget extends StatelessWidget {
  final TaskModel taskModel;

  const TaskCardWidget({super.key, required this.taskModel});

  Color _colorByStatus() {
    switch (taskModel.type) {
      case MaintenanceType.Fixing:
        return CustomColor.cardStatusRed;
      case MaintenanceType.ChangePart:
        return CustomColor.cardStatusGreen;
      case MaintenanceType.Others:
        return CustomColor.cardStatusBlue;
      default:
        return CustomColor.cardStatusDefault;
    }
  }
  Color _backgroundColorByStatus() {
    switch (taskModel.type) {
      case MaintenanceType.Fixing:
        return CustomColor.cardStatusRedBackground;
      case MaintenanceType.ChangePart:
        return CustomColor.cardStatusGreenBackground;
      case MaintenanceType.Others:
        return CustomColor.cardStatusBlueBackground;
      default:
        return CustomColor.cardStatusDefaultBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 16,
              child: Container(
                width: 3,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _colorByStatus(),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vspace(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title",
                              style: CustomText.cardTitle(),
                            ),
                            vspace(5),
                            Text(
                              "Subtitle",
                              style: CustomText.cardSubtitle(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: _backgroundColorByStatus(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                child: Text(
                                  taskModel.type.name,
                                  style: CustomText.cardStatus(
                                    taskModel.type
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                vspace(10),
                const Divider(
                  height: 0,
                ),
                vspace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Description",
                    style: CustomText.cardMessage(),
                  ),
                ),
                vspace(15),
              ],
            ),
          ],
        )
      ),
    );
  }
}