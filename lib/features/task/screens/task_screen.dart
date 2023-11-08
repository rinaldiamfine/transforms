import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/custom_button.dart';
import 'package:transforms/widgets/empty_widget.dart';
import 'package:transforms/widgets/input_widget.dart';
import 'package:transforms/widgets/task_line_widget.dart';

class TaskScreen extends GetView<TaskController> {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      header: FlexibleSpaceBar(
        title: Text(
        controller.arguments.title,
        style: CustomText.appTitle(),
        ),
      ),
      leading: BackButton(
        color: CustomColor.primary,
      ),
      contents: [
        vspace(20),
        GetBuilder<TaskController>(
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Karyawan",
                        style: CustomText.inputTitle(),
                      ),
                      vspace(10),
                      Column(
                        children: [
                          CustomListPickerWithImageWidget(
                            action: () {
                              controller.pickerEmployee();
                            },
                            dataId: controller.employee.id,
                            dataTitle: controller.employee.name,
                            dataSubtitle: controller.employee.subtitle ?? "",
                            photo: "",
                            // isEnable: controller.arguments.isEditable,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                vspace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mesin",
                        style: CustomText.inputTitle(),
                      ),
                      vspace(10),
                      Column(
                        children: [
                          CustomListPickerWidget(
                            action: () {
                              controller.pickerMachine();
                            },
                            dataId: controller.machine.id,
                            dataTitle: controller.machine.name,
                            // isEnable: controller.arguments.isEditable,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vspace(10),
                        if (!controller.isMachineValid.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Mesin tidak boleh kosong",
                              style: CustomText.hintTextInputError(),
                            ),
                          )
                      ],
                    )),
                  ],
                ),
              ],
            );
          }
        ),
        

        vspace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tanggal Pemeliharaan",
                style: CustomText.inputTitle(),
              ),
              vspace(10),
              CustomInputWidget(
                controller: controller.nameController, 
                focusNode: controller.nameFocusNode,
                onChanged: (value) {
                  controller.validateName(name: controller.nameController.text);
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vspace(10),
                if (!controller.isNameValid.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Tanggal pemeliharaan tidak boleh kosong",
                      style: CustomText.hintTextInputError(),
                    ),
                  )
              ],
            )),
          ],
        ),
        vspace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masalah Mesin",
                style: CustomText.inputTitle(),
              ),
              vspace(10),
              CustomInputWidget(
                maxLines: 5,
                controller: controller.noteController, 
                focusNode: controller.noteFocusNode,
                hintText: "Mesin mengalami ... ",
                onChanged: (value) {
                  controller.validateName(name: controller.noteController.text);
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            Obx(() => Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vspace(10),
                  if (!controller.isNameValid.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Tuliskan masalah yang ditemukan pada mesin tersebut",
                        style: CustomText.hintTextInputError(),
                      ),
                    )
                ],
              ),
            )),
          ],
        ),
        vspace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tipe Pemeliharaan",
                style: CustomText.inputTitle(),
              ),
              vspace(10),
              Column(
                children: [
                Obx(() => CustomSelectionInputWidget(
                    onChanged: (value) {
                      controller.changeMaintenanceType(value);
                    },
                    
                    currentValue: controller.selectedMaintenanceType.value != null
                        ? controller.selectedMaintenanceType.value!.id.toString()
                        : "0",
                    isExpanded: true,
                    items: [
                      for (var type in controller.maintenanceTypes)
                        DropdownMenuItem<String>(
                          value: type.id.toString(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              type.name,
                              style: CustomText.inputText()
                            ),
                          ),
                        )
                    ]),
                ),
                ],
              ),
            ],
          ),
        ),
        vspace(20),


        GetBuilder<TaskController>(
          builder: (controller) {
            return Column(
              children: [
                // if ([MaintenanceType.Fixing, MaintenanceType.Others].contains(controller.selectedMaintenanceType.value?.type))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Alasan ${controller.selectedMaintenanceType.value?.name}",
                          style: CustomText.inputTitle(),
                        ),
                        CustomButton(
                          onPressed: () {
                            controller.addMaintenanceReason();
                            // controller.customDialog.modalTaskLine(
                            //   title: 'Tambah Alasan',
                            //   type: MaintenanceType.Fixing,
                            //   action: () {
                            //     Get.back();
                            //   },
                            //   btnName: 'Simpan', 
                            //   productNameController: controller.productNameController, 
                            //   productNameFocusNode: controller.productNameFocusNode, 
                            //   quantityController: controller.quantityController, 
                            //   quantityFocusNode: controller.quantityFocusNode, 
                            //   reasonController: controller.reasonController, 
                            //   reasonFocusNode: controller.reasonFocusNode,
                            // );
                          }, 
                          btnFontSize: 12,
                          buttonName: "Tambah",
                          imageRight: const Icon(
                            Icons.add,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  vspace(10),
                  const Divider(
                    height: 0,
                  ),
                  vspace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GetBuilder<TaskController>(
                      builder: (controller) {
                        return Column(
                          children: [
                            if (controller.taskLines.isEmpty)
                              EmptyWidget(
                                image: SizedBox(
                                  width: 58,
                                  height: 58,
                                  child: Image.asset("assets/images/search-empty.png",),
                                ),
                                title: "Tidak ada Data!",
                                message: "Anda belum menambahkan\nalasan dari pemeliharaan.",
                              ),
                            
                            vspace(10),
                            if (controller.taskLines.isNotEmpty)
                              for (var line in controller.taskLines) 
                                Column(
                                  children: [
                                    TaskLineWidget(
                                      model: line,
                                      action: () {
                                        controller.taskLines.remove(line);
                                        controller.update();
                                      },
                                    ),
                                    vspace(10),
                                  ],
                                )
                          ],
                        );
                      }
                    ),
                  )
              ],
            );
          }
        ),
        
        vspace(10),
        const Divider(
          height: 0,
        ),
        vspace(40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: CustomColor.gradientButtonBlue),
              borderRadius: BorderRadius.circular(18),
            ),
            child: CustomButton(
                backgroundColor: Colors.transparent,
                // isDisabled: true,
                onPressed: () {
                  // controller.searchGraveAction();
                },
                buttonName: "Kirim"),
          ),
        ),
        vspace(60),
      ]
    );
  }
}