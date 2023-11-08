import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/custom_button.dart';
import 'package:transforms/widgets/input_widget.dart';

class TaskReasonScreen extends GetView<TaskReasonController> {
  const TaskReasonScreen({super.key});

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
        GetBuilder<TaskReasonController>(builder: (controller) {
          return Column(
            children: [
              vspace(20),
              if (controller.arguments.type == MaintenanceType.ChangePart)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama suku cadang",
                            style: CustomText.inputTitle(),
                          ),
                          vspace(10),
                          CustomInputWidget(
                            controller: controller.productNameController, 
                            focusNode: controller.productNameFocusNode,
                            hintText: "Suku cadang yang digunakan ... ",
                            onChanged: (value) {
                              controller.inputTextValidator(
                                controller: controller.productNameController,
                                status: controller.isProductNameValid
                              );
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
                              if (!controller.isProductNameValid.value)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Tuliskan nama suku cadang yang digunakan.",
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
                            "Jumlah",
                            style: CustomText.inputTitle(),
                          ),
                          vspace(10),
                          CustomInputWidget(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: controller.quantityController, 
                            focusNode: controller.quantityFocusNode,
                            hintText: "Jumlah yang digunakan ... ",
                            onChanged: (value) {
                              controller.inputTextValidator(
                                controller: controller.quantityController,
                                status: controller.isQuantityValid
                              );
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
                              if (!controller.isQuantityValid.value)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Tuliskan jumlah suku cadang yang digunakan.",
                                    style: CustomText.hintTextInputError(),
                                  ),
                                )
                            ],
                          ),
                        )),
                      ],
                    ),
                    vspace(20),
                  ],
                ),
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
                      controller: controller.reasonController, 
                      focusNode: controller.reasonFocusNode,
                      hintText: "Mesin mengalami ... ",
                      onChanged: (value) {
                        controller.inputTextValidator(
                          controller: controller.reasonController,
                          status: controller.isReasonValid
                        );
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
                        if (!controller.isReasonValid.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Tuliskan alasan dari pemeliharaan mesin.",
                              style: CustomText.hintTextInputError(),
                            ),
                          )
                      ],
                    ),
                  )),
                ],
              ),
              vspace(20),
              const Divider(
                height: 0,
              ),
              vspace(20),
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
                      isDisabled: !controller.buttonValidator(),
                      onPressed: () {
                        controller.save();
                      },
                      buttonName: "Simpan"),
                ),
              ),
            ],
          );
        })
      ]
    );
  }
}