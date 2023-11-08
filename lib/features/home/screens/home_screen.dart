import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/models/machine_model.dart';
import 'package:transforms/routes/routes.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/input_widget.dart';
import 'package:transforms/widgets/machine_card_widget.dart';
import 'package:transforms/widgets/picture_widget.dart';
import 'package:transforms/widgets/segmented_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    var appbarHeight = 80.0;
    return CustomLayout(
      collapsedHeight: appbarHeight,
      expandedHeight: 150,
      floatingActionButton: _buildFloatingActionButton(),
      header: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            top = constraints.biggest.height;
            return FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 10),
                        child: top.toInt() >= (MediaQuery.of(context).padding.top + kToolbarHeight + appbarHeight).toInt() 
                        ? Text(
                          controller.userModel.value.id,
                          style: CustomText.navTitle(),
                        ) : null
                      ),
                      Text(
                        controller.userModel.value.name,
                        style: CustomText.navSubtitle(),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 10),
                    child: _buildProfilePicture()
                  )
                ],
              ),
              centerTitle: false,
              expandedTitleScale: 1.2,
            );
          }
        ),
      ),
      contents: [
        vspace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColor.segmentedBorder,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: SegmentedWidget(
                onChanged: (value) {
                  controller.currentSegment.value = value;
                  controller.update();
                },
                initSegment: controller.currentSegment.value,
                segment: {
                  HomeSegmentType.machine: Obx(
                    () => Text(
                      'Mesin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: controller.currentSegment.value ==
                                HomeSegmentType.machine
                            ? CustomColor.segmentTextActive
                            : CustomColor.segmentTextInActive,
                        fontSize: 12,
                        fontWeight: controller.currentSegment.value ==
                                HomeSegmentType.machine
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  HomeSegmentType.employee: Obx(
                    () => Text(
                      'Teknisi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: controller.currentSegment.value ==
                                HomeSegmentType.employee
                            ? CustomColor.segmentTextActive
                            : CustomColor.segmentTextInActive,
                        fontSize: 12,
                        fontWeight: controller.currentSegment.value ==
                                HomeSegmentType.employee
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                },
              ),
            ),
          ),
        ),
        vspace(20),
        Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomInputWidget(
              controller: controller.searchController,
              focusNode: controller.searchFocusNode,
              onChanged: (value) {
                controller.filterModel(
                  name: value
                );
              },
              hintText: "Cari ${controller.currentSegment.value == HomeSegmentType.machine ? "mesin" : "teknisi" } ...",
            ),
          ),
        ),
        vspace(20),
        const Divider(
          height: 0,
        ),
        GetBuilder<HomeController>(
          builder: (controller) {
            return Column(
              children: [
                vspace(20),

                if (controller.currentSegment.value == HomeSegmentType.machine)
                  _machineBuilder(),

                if (controller.currentSegment.value == HomeSegmentType.employee)
                  _employeeBuilder(),

                vspace(80),
              ],
            );
          }
        )
      ],
    );
  }
  
  Widget _profilePictureTemplate(String photo, {Widget? icon}) {
    return PictureWidget(
      size: 54,
      iconSize: 20,
      photo: photo.obs,
      icon: icon,
      action: () => Get.toNamed(AppRoutes.profile),
    );
  }
  Widget _employeeBuilder() {
    return Column(
      children: [
        if (controller.status.isLoading)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), 
            child: Skeletonizer(
              child: CustomListPickerWithImageWidget(
                action: () {
                
                },
                dataId: "",
                dataTitle: "Skeleton title", 
                dataSubtitle: "Skeleton subtitle",
                photo: "",
              )
            ),
          ),

        if (controller.status.isSuccess)
          for (var employee in controller.filteredEmployees)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomListPickerWithImageWidget(
                    action: () {
                      
                    },
                    dataId: employee.id,
                    dataTitle: employee.id,
                    dataSubtitle: employee.name,
                    photo: employee.photo ?? "",
                  ),
                ),
                vspace(10),
              ],
            ),
      ],
    );
  }
  Widget _machineBuilder() {
    return Column(
      children: [
        if (controller.status.isLoading) 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Skeletonizer(child: MachineCardWidget(
              machineModel: MachineModel(
                id: "SK001",
                dateUpdated: DateTime.now(), 
                type: MachineTypeModel(
                  serial: "SR001", 
                  name: "Skeleton Name", 
                  type: "Skeleton Type", 
                  description: "Skeleton Description", 
                  image: ""), 
                status: MachineStatus.Breakdown, 
              ),
              action: () {}
              ),
            ),
          ),
        if (controller.status.isSuccess)
          for (var machine in controller.fileteredMachines)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MachineCardWidget(
                    action: () {
                      controller.viewMachine(
                        machine: machine,
                      );
                    },
                    machineModel: machine
                  )
                ),
                vspace(10),
              ],
            ),
      ],
    );
  }
  
  Widget _buildProfilePicture() {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.status.isLoading ? Skeletonizer(
        enabled: controller.status.isLoading,
        child: _profilePictureTemplate(
          controller.userModel.value.photo ?? "",
        )
      ) : _profilePictureTemplate(
          controller.userModel.value.photo ?? "",
          icon: SizedBox(
            width: 18,
            height: 18,
            child: Image.asset("assets/icons/ic_edit.png"))
        );
    });
  }

  Widget _buildFloatingActionButton() {
    return Obx(() => controller.currentSegment.value == HomeSegmentType.machine ? _homeFloatingButton(
      action: () {
        controller.createTask();
      },
      icon: Icon(
        Icons.edit, 
        size: 28,
        color: CustomColor.white,
      )) : _homeFloatingButton(
      action: () {
        controller.createEmploye();
      },
      icon: Icon(
        Icons.person_add_rounded, 
        size: 28,
        color: CustomColor.white,
      )
    ),
    );
  }

  Widget _homeFloatingButton({Function()? action, Widget? icon}) {
    return ClipOval(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CustomColor.gradientButtonBlue
            ),
          ),
          width: 60,
          height: 60,
          child: InkWell(
            onTap: action,
            child: icon,
          ),
        ),
      ),
    );
  }
}