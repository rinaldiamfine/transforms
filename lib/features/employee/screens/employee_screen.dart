import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/custom_button.dart';
import 'package:transforms/widgets/input_widget.dart';

class EmployeeScreen extends GetView<EmployeeController> {
  const EmployeeScreen({super.key});

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
        GetBuilder<EmployeeController>(
          builder: (controller) {
            return Column(
              children: [
                
                vspace(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tipe User",
                        style: CustomText.inputTitle(),
                      ),
                      vspace(10),
                      Column(
                        children: [
                        Obx(() => CustomSelectionInputWidget(
                            onChanged: (value) {
                              // controller.selectedUserRoles(value);
                            },
                            currentValue: "",
                            isExpanded: true,
                            items: [
                              for (var role in controller.roles)
                                DropdownMenuItem<String>(
                                  value: role.id.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      role.name,
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
              buttonName: "Buat"
            ),
          ),
        ),
        vspace(60),
      ]
    );
  }
}