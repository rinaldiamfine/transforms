import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/models/machine_model.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';

class MachineDetailScreen extends GetView<MachineDetailController> {
  const MachineDetailScreen({super.key});


  Color _colorByStatus({required MachineModel machineModel}) {
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
  Color _backgroundColorByStatus({required MachineModel machineModel}) {
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
    return CustomLayout(
      header: FlexibleSpaceBar(
        title: Text(
        "Detail Mesin",
        style: CustomText.appTitle(),
        ),
      ),
      leading: BackButton(
        color: CustomColor.primary,
      ),
      contents: [
        vspace(20),
        GetBuilder<MachineDetailController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          ClipRRect(
                            child: Material(
                              borderRadius: BorderRadius.circular(5),
                              color: _backgroundColorByStatus(machineModel: controller.arguments.model),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                child: Text(
                                  controller.arguments.model.status != null ? controller.arguments.model.status!.name : "Tidak diketahui",
                                  style: CustomText.cardMachineStatus(
                                    controller.arguments.model.status
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                                "Kode mesin",
                                style: CustomText.cardTitle(),
                              ),
                              Text(
                                controller.arguments.model.id,
                                style: CustomText.cardSubtitle(),
                              ),
                              vspace(5),
                              Text(
                                "Nama mesin",
                                style: CustomText.cardTitle(),
                              ),
                              Text(
                                controller.arguments.model.type.name,
                                style: CustomText.cardSubtitle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      vspace(10),

                      const Divider(height: 0,),

                      vspace(10),
                      Text(
                        "Deskripsi mesin",
                        style: CustomText.cardTitle(),
                      ),
                      vspace(5),
                      Text(
                        controller.arguments.model.type.description,
                        style: CustomText.cardSubtitle(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        vspace(40),
      ]
    );
  }
}