import 'package:flutter/material.dart';
import 'package:transforms/models/task_line_model.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';

class TaskLineWidget extends StatelessWidget {
  final TaskLineModel model;
  final Function() action;
  const TaskLineWidget({super.key, required this.model, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: CustomColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.type == MaintenanceType.ChangePart)
                  Column(
                    children: [
                      Text(
                        "${model.productName} x ${model.quantity}",
                        style: CustomText.subtitle2(
                          weight: FontWeight.w600
                        ),
                      ),
                      vspace(3),
                    ],
                  ),
                  Text(
                    model.message,
                    style: CustomText.subtitle2(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: action,
                child: ClipOval(
                  child: Icon(
                    Icons.remove_circle_outline_rounded,
                    color: CustomColor.cardStatusRed,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}