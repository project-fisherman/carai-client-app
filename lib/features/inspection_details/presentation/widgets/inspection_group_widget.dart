import 'package:flutter/material.dart';
import '../../domain/entities/inspection_form.dart';
import 'inspection_item_widget.dart';

class InspectionGroupWidget extends StatelessWidget {
  final InspectionGroup group;
  final Map<String, dynamic> allAnswers;
  final Function(int seqNo, Map<String, dynamic> value) onItemAnswerChanged;

  const InspectionGroupWidget({
    super.key,
    required this.group,
    required this.allAnswers,
    required this.onItemAnswerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group Label
          Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 12.0),
            child: Text(
              group.groupLabel,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Items List
          ...group.items.map((item) {
            final answer =
                allAnswers[item.seqNo.toString()] as Map<String, dynamic>? ??
                {};
            return InspectionItemWidget(
              item: item,
              answer: answer,
              onAnswerChanged: (newValue) =>
                  onItemAnswerChanged(item.seqNo, newValue),
            );
          }),

          // Group Opinion (if needed, though schema removed it?
          // Wait, user said "remove bg_color, group_opinion".
          // So no group opinion here!)
        ],
      ),
    );
  }
}
