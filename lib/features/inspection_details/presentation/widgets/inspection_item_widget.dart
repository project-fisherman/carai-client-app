import 'package:flutter/material.dart';
import '../../domain/entities/inspection_item.dart';
import 'good_warning_check_widget.dart';
import 'front_and_rear_measurement_check_widget.dart';

class InspectionItemWidget extends StatelessWidget {
  final InspectionItem item;
  final Map<String, dynamic> answer; // The current answer state for this item
  final ValueChanged<Map<String, dynamic>> onAnswerChanged;

  const InspectionItemWidget({
    super.key,
    required this.item,
    required this.answer,
    required this.onAnswerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: _buildBorder(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.itemName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // We could show seqNo or Info icon
              Text(
                '#${item.seqNo}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Method / Description
          if (item.widgetType == InspectionItemWidgetType.goodWarningCheck &&
              item.method.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                item.method.replaceAll('<br>', '\n'),
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),

          // Input Widget
          _buildInput(),
        ],
      ),
    );
  }

  Border? _buildBorder() {
    // If Good -> Green, Warn -> Orange border
    final status = answer['status'];

    if (status == 'good') {
      return const Border(left: BorderSide(color: Colors.green, width: 4));
    }
    if (status == 'warning') {
      return const Border(left: BorderSide(color: Colors.orange, width: 4));
    }
    return null;
  }

  Widget _buildInput() {
    switch (item.widgetType) {
      case InspectionItemWidgetType.goodWarningCheck:
        return GoodWarningCheckWidget(value: answer, onChanged: onAnswerChanged);
      case InspectionItemWidgetType.frontAndRearMeasurementCheck:
        return FrontAndRearMeasurementCheckWidget(
          methodTemplate: item.method,
          value: answer,
          onChanged: onAnswerChanged,
        );
      case null:
      default:
        return const SizedBox.shrink();
    }
  }
}
