import 'package:flutter/material.dart';

class GoodWarningCheckWidget extends StatelessWidget {
  final Map<String, dynamic>? value;
  final ValueChanged<Map<String, dynamic>> onChanged;

  const GoodWarningCheckWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // value structure: { 'is_good': bool?, 'is_warn': bool? }
    final isGood = value?['is_good'] == true;
    final isWarn = value?['is_warn'] == true;

    return Row(
      children: [
        Expanded(
          child: _buildToggleButton(
            label: '양호',
            isSelected: isGood,
            color: Colors.green,
            onTap: () {
              final newValue = Map<String, dynamic>.from(value ?? {});
              newValue['is_good'] = !isGood;
              if (newValue['is_good']) newValue['is_warn'] = false;
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
              newValue['is_warn'] = !isWarn;
              if (newValue['is_warn']) newValue['is_good'] = false;
              onChanged(newValue);
            },
          ),
        ),
      ],
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
