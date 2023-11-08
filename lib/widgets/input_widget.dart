import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/picture_widget.dart';

typedef CustomValidator = String? Function(String? value);

class CustomListPickerWidget extends StatelessWidget {
  final String dataId;
  final String dataTitle;
  final bool? isEnable;
  final Function() action;

  const CustomListPickerWidget({super.key, required this.dataId, required this.dataTitle, required this.action, this.isEnable});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isEnable != null ?
          isEnable! ? CustomColor.inputEnable : CustomColor.inputDisable
          : CustomColor.inputEnable,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isEnable != null ?
              isEnable! ? action : null
              : action,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    dataTitle,
                    style: CustomText.inputText(
                      color : isEnable != null ?
                      isEnable! ? CustomColor.inputText : CustomColor.inputTextDisable
                      : CustomColor.inputText,
                    )
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: CustomColor.primary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListPickerWithImageWidget extends StatelessWidget {
  final String dataId;
  final String dataTitle;
  final String dataSubtitle;
  final String photo;
  final bool? isEnable;
  final Function() action;

  const CustomListPickerWithImageWidget({super.key, required this.dataId, required this.dataTitle, required this.action, this.isEnable, required this.dataSubtitle, required this.photo});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isEnable != null ?
          isEnable! ? CustomColor.inputEnable : CustomColor.inputDisable
          : CustomColor.inputEnable,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isEnable != null ?
              isEnable! ? action : null
              : action,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 20),
              child: Row(
                children: [
                  PictureWidget(
                    size: 32,
                    iconSize: 10,
                    // photo: "",
                  ),
                  hspace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataTitle,
                        style: CustomText.inputText(
                          size: 12,
                          color : isEnable != null ?
                          isEnable! ? CustomColor.inputText : CustomColor.inputTextDisable
                          : CustomColor.inputText,
                        )
                      ),
                      vspace(3),
                      Text(
                        dataSubtitle,
                        style: CustomText.inputText(
                          size: 16,
                          color : isEnable != null ?
                          isEnable! ? CustomColor.inputText : CustomColor.inputTextDisable
                          : CustomColor.inputText,
                        )
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: CustomColor.primary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSelectionInputWidget extends StatelessWidget {
  final String currentValue;
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> items;
  final bool isExpanded;
  final double padding;
  final double height;

   const CustomSelectionInputWidget({
    Key? key,
    required this.currentValue,
    required this.items,
    this.isExpanded = false,
    this.padding = 20.0,
    required this.onChanged,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: CustomColor.white,
      ),
      child: DropdownButton(
        value: currentValue,
        icon: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Icon(
            Icons.keyboard_arrow_down, color: CustomColor.primary, size: 24,),
        ),
        iconEnabledColor: CustomColor.primary,
        underline: Container(),
        isExpanded: isExpanded,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hintText;
  final String? prefixText;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final bool? isEnable;
  final TextInputType? keyboardType;
  final CustomValidator? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;

  const CustomInputWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.obscureText,
    this.prefixText,
    this.keyboardType,
    this.validator, this.isEnable, this.onChanged, this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isEnable != null ?
          isEnable! ? CustomColor.inputEnable : CustomColor.inputDisable
          : CustomColor.inputEnable,
      ),
      child: TextFormField(
        cursorColor: CustomColor.primary,
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        inputFormatters: inputFormatters,
        obscureText: obscureText ?? false,
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        enabled: isEnable,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 0),
            child: Text(prefixText ?? "", style: CustomText.prefixText(),),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          focusColor: CustomColor.primary,
          hintText: hintText,
          hintStyle: CustomText.hintInputText(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.primary),
            borderRadius: BorderRadius.circular(18),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        
        keyboardType: keyboardType,
        style: CustomText.inputText(
          color : isEnable != null ?
          isEnable! ? CustomColor.inputText : CustomColor.inputTextDisable
          : CustomColor.inputText,
        ),
      ),
    );
  }
}
