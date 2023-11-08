import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/enum.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/custom_button.dart';
import 'package:transforms/widgets/input_widget.dart';

class CustomDialogWidget {
  void _showTaskLineModal({
    required String title,
    required MaintenanceType type,
    required String btnName,
    required Function action,
    required TextEditingController productNameController,
    required FocusNode productNameFocusNode,
    required TextEditingController quantityController,
    required FocusNode quantityFocusNode,
    required TextEditingController reasonController,
    required FocusNode reasonFocusNode,
  }) {
    Get.bottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      // enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: CustomColor.backgroundColor,
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: CustomText.dialogTitle(),
              ),
            ),
            vspace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama suku cadang",
                  style: CustomText.inputSmallText(),
                ),
                vspace(10),
                CustomInputWidget(
                  controller: productNameController, 
                  focusNode: productNameFocusNode,
                  hintText: "Suku cadang yang digunakan ... ",
                  onChanged: (value) {
                    // controller.validateName(name: controller.noteController.text);
                  },
                ),
              ],
            ),
            vspace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah",
                  style: CustomText.inputSmallText(),
                ),
                vspace(10),
                CustomInputWidget(
                  controller: quantityController, 
                  focusNode: quantityFocusNode,
                  hintText: "Jumlah yang digunakan ... ",
                  onChanged: (value) {
                    // controller.validateName(name: controller.noteController.text);
                  },
                ),
              ],
            ),
            vspace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masalah Mesin",
                  style: CustomText.inputSmallText(),
                ),
                vspace(10),
                CustomInputWidget(
                  maxLines: 5,
                  controller: reasonController, 
                  focusNode: reasonFocusNode,
                  hintText: "Mesin mengalami ... ",
                  onChanged: (value) {
                    // controller.validateName(name: controller.noteController.text);
                  },
                ),
              ],
            ),
            vspace(20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 46,
                child: CustomButton(
                  onPressed: () => action(),
                  buttonName: btnName,
                  borderRadius: 20,
                ),
              ),
            ),
            vspace(120),
          ],
        ),
      ),
      // barrierDismissible: false,
    );
  }

  void _showDialog({
    required String dialogIconPath,
    required String dialogTitle,
    required String dialogSubtitle,
    required String dialogButtonText,
    required Function onButtonPressed,
  }) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      dialogIconPath,
                    ),
                  ),
                ),
                vspace(15),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    dialogTitle,
                    style: CustomText.dialogTitle(),
                  ),
                ),
                vspace(10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    dialogSubtitle,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: CustomText.subtitle(),
                  ),
                ),
                vspace(10),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    onPressed: () => onButtonPressed(),
                    buttonName: dialogButtonText,
                    borderRadius: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void success({
    required String title,
    required String subtitle,
    required Function onButtonPressed,
  }) {
    _showDialog(
      dialogIconPath: 'assets/icons/ic_alert_dialog.png',
      dialogTitle: title,
      dialogSubtitle: subtitle,
      dialogButtonText: 'Ok',
      onButtonPressed: onButtonPressed,
    );
  }

  void failed({
    required String title,
    required String subtitle,
    required Function onButtonPressed,
  }) {
    _showDialog(
      dialogIconPath: 'assets/icons/ic_alert_dialog.png',
      dialogTitle: title,
      dialogSubtitle: subtitle,
      dialogButtonText: 'Kembali',
      onButtonPressed: onButtonPressed,
    );
  }

  void custom({
    required String dialogIconPath,
    required String dialogTitle,
    required String dialogSubtitle,
    required String dialogButtonText,
    required Function onButtonPressed,
  }) {
    _showDialog(
      dialogIconPath: dialogIconPath,
      dialogTitle: dialogTitle,
      dialogSubtitle: dialogSubtitle,
      dialogButtonText: dialogButtonText,
      onButtonPressed: onButtonPressed,
    );
  }

  void modalTaskLine({
    required String title,
    required MaintenanceType type,
    required String btnName,
    required Function action,
    required TextEditingController productNameController,
    required FocusNode productNameFocusNode,
    required TextEditingController quantityController,
    required FocusNode quantityFocusNode,
    required TextEditingController reasonController,
    required FocusNode reasonFocusNode,
  }) {
    _showTaskLineModal(title: title, type: type, btnName: btnName, action: action, productNameController: productNameController, productNameFocusNode: productNameFocusNode, quantityController: quantityController, quantityFocusNode: quantityFocusNode, reasonController: reasonController, reasonFocusNode: reasonFocusNode);
  }
}
