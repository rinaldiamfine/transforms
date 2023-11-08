import 'package:flutter/material.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';

class EmptyWidget extends StatelessWidget {
  final Widget? image;
  final double? space;
  final String? title;
  final String? message;
  const EmptyWidget({super.key, this.image, this.message, this.space, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image ?? Icon(
            Icons.list_alt_rounded,
            size: 60,
            color: CustomColor.title.withOpacity(0.5),
          ),
          hspace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vspace(space ?? 30),
              Text(
                title ?? "",
                style: CustomText.emptyTitle(),
              ),
              vspace(3),
              Text(
                message ?? "",
                style: CustomText.emptySubtitle(),
              ),
              vspace(space ?? 30),
            ],
          ),
        ],
      ),
    );
  }
}