import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/tools/enum.dart';

class SegmentedWidget extends StatelessWidget {
  final Map<HomeSegmentType, Widget> segment;
  final HomeSegmentType initSegment;
  final Function(HomeSegmentType) onChanged;
  const SegmentedWidget({super.key, required this.segment, required this.initSegment, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CustomSlidingSegmentedControl<HomeSegmentType>(
        height: 45,
        initialValue: initSegment,
        isStretch: true,
        children: segment,
        // innerPadding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: CustomColor.segmentedBoxColor,
          borderRadius: BorderRadius.circular(13),
        ),
        thumbDecoration: BoxDecoration(
          color: CustomColor.segmentedActive,
          borderRadius: BorderRadius.circular(14),
        ),
        onValueChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}