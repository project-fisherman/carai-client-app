import 'package:flutter/material.dart';
import '../../domain/entities/inspection_form.dart';

class DynamicHeaderForm extends StatelessWidget {
  final List<InspectionHeaderField> fields;
  final Map<String, dynamic> answers;
  final Function(String id, dynamic value) onAnswerChanged;

  const DynamicHeaderForm({
    super.key,
    required this.fields,
    required this.answers,
    required this.onAnswerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: fields.map((field) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildField(field),
        );
      }).toList(),
    );
  }

  Widget _buildField(InspectionHeaderField field) {
    final currentValue = answers[field.id];

    return TextField(
      controller: TextEditingController(text: currentValue?.toString() ?? '')
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: (currentValue?.toString() ?? '').length),
        ),
      onChanged: (value) {
        // Determine type conversion if needed
        if (field.type == 'number') {
          onAnswerChanged(field.id, num.tryParse(value) ?? value);
        } else {
          onAnswerChanged(field.id, value);
        }
      },
      keyboardType: field.type == 'number'
          ? TextInputType.number
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: field.label,
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
