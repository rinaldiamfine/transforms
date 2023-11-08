import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/tools/file.dart';

class PictureWidget extends StatelessWidget {
  final Function()? action;
  final double? size;
  final Widget? icon;
  final double? iconSize;
  final Rx<String>? photo;
  final FileHelper fileHelper = FileHelper();

  PictureWidget(
      {super.key,
      this.action,
      this.size,
      this.icon,
      this.iconSize,
      this.photo});

  Widget imageProfile() {
    try {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: MemoryImage(
            fileHelper.decodeFileAsImage(fileEncode: photo!.value)!),
      );
    } catch (e) {
      return CircleAvatar(
        backgroundColor: CustomColor.primary,
        child: Image.asset("assets/images/photo-placeholder.png"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 86,
      width: size ?? 86,
      child: Stack(
        fit: StackFit.loose,
        children: [
          SizedBox(
            height: size ?? 86,
            width: size ?? 86,
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: action,
                  child: imageProfile(),
                ),
              ),
            ),
          ),
          if (icon != null)
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipOval(
                child: Material(
                  color: CustomColor.white, // Button color
                  child: SizedBox(
                    width: iconSize ?? 32,
                    height: iconSize ?? 32,
                    child: icon ??
                        Image.asset(
                          "assets/icons/ic_edit.png",
                        ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
