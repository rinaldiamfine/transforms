import 'package:flutter/material.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/tools/enum.dart';

class CustomText {
  static String regular = "Gilroy-Regular";
  static String heavy = "Gilroy-Heavy";
  static String bold = "Gilroy-Bold";
  static String light = "Gilroy-Light";
  static String medium = "Gilroy-Medium";
  
  static TextStyle appTitle({double? size, FontWeight? weight}) {
    return TextStyle(
        fontFamily: regular,
        fontWeight: weight ?? FontWeight.w700,
        fontSize: size ?? 18,
        color: CustomColor.title);
  }

  static TextStyle navTitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: CustomColor.navTitle);
  }

  static TextStyle navSubtitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: CustomColor.navSubtitle);
  }


  static TextStyle cardTitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: CustomColor.cardTitle);
  }
  static TextStyle cardSubtitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: CustomColor.cardSubtitle);
  }
  static TextStyle cardMachineStatus(MachineStatus? status) {
    switch (status) {
      case MachineStatus.Breakdown:
        return TextStyle(
          fontFamily: regular,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: CustomColor.cardStatusRed
        );
      case MachineStatus.Running:
        return TextStyle(
            fontFamily: regular,
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: CustomColor.cardStatusGreen
        );
      case MachineStatus.Maintenance:
        return TextStyle(
          fontFamily: regular,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: CustomColor.cardStatusBlue
        );
      default:
        return TextStyle(
          fontFamily: regular,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: CustomColor.cardStatusDefault
        );
    }
  }

  static TextStyle cardStatus(MaintenanceType? status) {
    switch (status) {
      case MaintenanceType.Fixing:
        return TextStyle(
          fontFamily: regular,
          fontWeight: FontWeight.w400,
          fontSize: 8,
          color: CustomColor.cardStatusRed
        );
      case MaintenanceType.ChangePart:
        return TextStyle(
            fontFamily: regular,
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: CustomColor.cardStatusGreen
        );
      case MaintenanceType.Others:
        return TextStyle(
          fontFamily: regular,
          fontWeight: FontWeight.w400,
          fontSize: 8,
          color: CustomColor.cardStatusBlue
        );
      default:
        return TextStyle(
          fontFamily: regular,
          fontWeight: FontWeight.w400,
          fontSize: 8,
          color: CustomColor.cardStatusDefault
        );
    }
  }
  static TextStyle cardMessage() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: CustomColor.cardMessage);
  }

  // Input
  static TextStyle inputTitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: CustomColor.inputTitle);
  }

  static TextStyle inputText({Color? color, double? size}) {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w500,
        fontSize: size ?? 16,
        color: color ?? CustomColor.inputText
    );
  }

  static TextStyle hintInputText() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: CustomColor.hintInputText);
  }

  static TextStyle prefixText() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: CustomColor.prefixText);
  }

  static TextStyle inputSmallText() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: CustomColor.inputText);
  }
  static TextStyle hintTextInputError() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: CustomColor.hintTextInputError);
  }

  // Empty
  static TextStyle emptyTitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: CustomColor.emptyTitle);
  }
  static TextStyle emptySubtitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w500,
        fontSize: 10,
        height: 1.4,
        color: CustomColor.emptySubtitle);
  }

  static TextStyle title({double? size, FontWeight? weight}) {
    return TextStyle(
        fontFamily: regular,
        fontWeight: weight ?? FontWeight.w700,
        fontSize: size ?? 18,
        color: CustomColor.title);
  }

  static TextStyle subtitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.4,
        color: CustomColor.subtitle);
  }
  static TextStyle subtitle2({FontWeight? weight}) {
    return TextStyle(
        fontFamily: regular,
        fontWeight: weight ?? FontWeight.w400,
        fontSize: 12,
        color: CustomColor.subtitle2);
  }

  static TextStyle dialogTitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 1.4,
        color: CustomColor.dialogTitle);
  }


  static TextStyle profileName() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: CustomColor.profileName);
  }
  static TextStyle profileTitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: CustomColor.profileTitle);
  }
  static TextStyle profileSubtitle() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: CustomColor.profileSubtitle);
  }


  static TextStyle profileTitleNote({double? size}) {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w700,
        fontSize: size ?? 14,
        color: CustomColor.profileTitleNote);
  }

  static TextStyle profileSubtitleNote({double? size, Color? color}) {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: size ?? 10,
        color: color ?? CustomColor.profileSubtitleNote);
  }
  static TextStyle settingValue() {
    return TextStyle(
        fontFamily: regular,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: CustomColor.settingValue);
  }
}