import 'package:flutter/material.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/tools/helper.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonName;
  final Widget? imageLeft;
  final Widget? imageRight;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool? isDisabled;
  final double? btnFontSize;
  final Color? btnFontColor;
  final double? borderRadius;
  final FontWeight? btnFontWeight;

  const CustomButton({
    super.key, 
    required this.onPressed,
    required this.buttonName,
    this.imageLeft, 
    this.imageRight, 
    this.isDisabled, 
    this.backgroundColor,
    this.btnFontSize,
    this.borderColor,
    this.btnFontColor,
    this.btnFontWeight,
    this.borderRadius
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled == true ? null : onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: CustomColor.inputDisable,
        elevation: 0,
        backgroundColor: backgroundColor ?? CustomColor.buttonActive,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 18.0), 
          side: BorderSide(
            color: (isDisabled == true) ? CustomColor.inputDisable : 
            (borderColor != null) ? borderColor! : CustomColor.buttonBorderActive)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageLeft != null)
              imageLeft!,
            if (imageLeft != null)
              hspace(10),
            Text(
              textAlign: TextAlign.center,
              buttonName, 
              style: TextStyle(
                fontSize: btnFontSize ?? 16,
                fontWeight: btnFontWeight ?? FontWeight.w600,
                color:  (isDisabled == true) ? CustomColor.buttonActive : btnFontColor ?? CustomColor.white
              )
            ),
            if (imageRight != null)
              hspace(10),
            if (imageRight != null)
              imageRight!,
          ],
        ),
      ),
    );
  }
}