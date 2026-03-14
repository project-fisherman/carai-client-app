import 'package:flutter/material.dart';

class GoodWarningCheckWidget extends StatelessWidget {
  final Map<String, dynamic>? value;
  final ValueChanged<Map<String, dynamic>> onChanged;
  final bool showCommentField;

  const GoodWarningCheckWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.showCommentField = true,
  });

  @override
  Widget build(BuildContext context) {
    // value structure: { 'status': 'good'|'warning'|null, 'comment': String? }
    final status = value?['status'];
    final comment = value?['comment']?.toString() ?? '';
    final isGood = status == 'good';
    final isWarn = status == 'warning';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildToggleButton(
                label: '양호',
                isSelected: isGood,
                color: Colors.green,
                onTap: () {
                  final newValue = Map<String, dynamic>.from(value ?? {});
                  newValue['status'] = isGood ? null : 'good';
                  onChanged(newValue);
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildToggleButton(
                label: '권고',
                isSelected: isWarn,
                color: Colors.orange,
                onTap: () {
                  final newValue = Map<String, dynamic>.from(value ?? {});
                  newValue['status'] = isWarn ? null : 'warning';
                  onChanged(newValue);
                },
              ),
            ),
          ],
        ),
        if (showCommentField) ...[
          const SizedBox(height: 12),
          _buildCommentField(comment),
        ],
      ],
    );
  }

  Widget _buildCommentField(String comment) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: TextEditingController(text: comment)
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: comment.length),
          ),
        onChanged: (v) {
          final newValue = Map<String, dynamic>.from(value ?? {});
          newValue['comment'] = v;
          onChanged(newValue);
        },
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: const InputDecoration(
          hintText: '특이사항 입력 (선택사항)',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: InputBorder.none,
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _buildToggleButton({
    required String label,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.2)
              : const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? color : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
