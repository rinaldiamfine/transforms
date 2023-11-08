import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/models/picker_model.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/empty_widget.dart';
import 'package:transforms/widgets/input_widget.dart';

class TaskPickerScreen extends GetView<TaskPickerController> {
  const TaskPickerScreen({super.key});

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomInputWidget(
            controller: controller.searchController,
            focusNode: controller.searchFocusNode,
            onChanged: (value) {
              controller.filterModel(
                name: value
              );
            },
            hintText: "Cari",
          ),
        ),
        vspace(20),
        const Divider(
          height: 0,
        ),
        vspace(20),
        GetBuilder<TaskPickerController>(
          builder: (controller) {
            return Column(
              children: [
                if (controller.status.isLoading)
                  Column(
                    children: [
                      Skeletonizer(
                        child: PickerItemWidget(
                          model: PickerModel(id: "", name: "Skeleton Name"), 
                          isSelected: true, 
                          onTap: () {  },
                        )),
                      Skeletonizer(
                        child: PickerItemWidget(
                          model: PickerModel(id: "", name: "Skeleton Name"), 
                          isSelected: true, 
                          onTap: () {  },
                        )),
                      Skeletonizer(
                        child: PickerItemWidget(
                          model: PickerModel(id: "", name: "Skeleton Name"), 
                          isSelected: true, 
                          onTap: () {  },
                        )),
                    ],
                  ),

                if (controller.status.isSuccess)
                  for (var model in controller.filterModels) 
                    PickerItemWidget(
                      model: model, 
                      isSelected: model.id == controller.model.id,
                      onTap: () {
                        controller.onSelect(model);
                      }
                    ),
                
                if (controller.status.isEmpty || controller.status.isError)
                  EmptyWidget(
                    image: SizedBox(
                      width: 58,
                      height: 58,
                      child: Image.asset("assets/images/search-empty.png",),
                    ),
                    title: "Perhatian!",
                    message: "Gagal memuat data.",
                  ),
              ],
            );
          }
        ),
        vspace(30),
      ]
    );
  }
}

class PickerItemWidget extends StatelessWidget {
  final PickerModel model;
  final bool isSelected;
  final Function() onTap;
  const PickerItemWidget({super.key, required this.model, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: CustomColor.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Material(
                color: CustomColor.white,
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          model.name,
                          style: CustomText.subtitle2(),
                        ),
                        const Spacer(),
                        if (isSelected)
                          Icon(
                            Icons.check_circle_outline_rounded,
                            color: CustomColor.primary,
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        vspace(15)
      ],
    );
  }
}