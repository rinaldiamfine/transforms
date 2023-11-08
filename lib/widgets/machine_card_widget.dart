import 'package:flutter/material.dart';
import 'package:transforms/models/machine_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/configuration.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';

class MachineCardWidget extends StatelessWidget {
  final MachineModel machineModel;
  final DateTime now = DateTime.now();
  final Function() action;

  MachineCardWidget({super.key, required this.machineModel, required this.action});

  Color _colorByStatus() {
    switch (machineModel.status) {
      case MachineStatus.Breakdown:
        return CustomColor.cardStatusRed;
      case MachineStatus.Running:
        return CustomColor.cardStatusGreen;
      case MachineStatus.Maintenance:
        return CustomColor.cardStatusBlue;
      default:
        return CustomColor.cardStatusDefault;
    }
  }
  Color _backgroundColorByStatus() {
    switch (machineModel.status) {
      case MachineStatus.Breakdown:
        return CustomColor.cardStatusRedBackground;
      case MachineStatus.Running:
        return CustomColor.cardStatusGreenBackground;
      case MachineStatus.Maintenance:
        return CustomColor.cardStatusBlueBackground;
      default:
        return CustomColor.cardStatusDefaultBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: CustomColor.white,
        child: InkWell(
          onTap: action,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 20),
                      child: ClipRRect(
                        child: Material(
                          borderRadius: BorderRadius.circular(5),
                          color: _backgroundColorByStatus(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            child: Text(
                              machineModel.status != null ? machineModel.status!.name : "Tidak diketahui",
                              style: CustomText.cardMachineStatus(
                                machineModel.status
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            child: Material(
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Icon(Icons.image, color: CustomColor.primary,)
                              )
                            )
                          ),
                          hspace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                machineModel.id,
                                style: CustomText.cardTitle(),
                              ),
                              vspace(3),
                              Text(
                                machineModel.type.name,
                                style: CustomText.cardSubtitle(),
                              ),
                              vspace(5),
                              Text(
                                "Terakhir di cek : ${timeago.format(now.subtract(now.difference(machineModel.dateUpdated)), locale: appLocale)}.",
                                style: CustomText.cardMessage(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    vspace(15),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}