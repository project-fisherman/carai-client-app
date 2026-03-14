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
      children:
          fields.map((field) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildField(context, field),
            );
          }).toList(),
    );
  }

  Widget _buildField(BuildContext context, InspectionHeaderField field) {
    final currentValue = answers[field.id];

    if (field.type == 'date') {
      return InkWell(
        onTap: () async {
          DateTime initialDate = DateTime.now();
          if (currentValue != null && currentValue.toString().isNotEmpty) {
            try {
              initialDate = DateTime.parse(currentValue.toString());
            } catch (_) {
              // Ignore parse error
            }
          }

          final picked = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Color(0xFFE65100),
                    onPrimary: Colors.white,
                    surface: Color(0xFF1E1E1E),
                    onSurface: Colors.white,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked != null) {
            final formatted =
                "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
            onAnswerChanged(field.id, formatted);
          }
        },
        child: AbsorbPointer(
          child: TextField(
            controller: TextEditingController(
              text: currentValue?.toString() ?? '',
            ),
            decoration: _buildInputDecoration(field.label, isDate: true),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return TextField(
      controller: TextEditingController(text: currentValue?.toString() ?? '')
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: (currentValue?.toString() ?? '').length),
        ),
      onChanged: (value) {
        if (field.type == 'number') {
          onAnswerChanged(field.id, num.tryParse(value) ?? value);
        } else {
          onAnswerChanged(field.id, value);
        }
      },
      keyboardType:
          field.type == 'number' ? TextInputType.number : TextInputType.text,
      decoration: _buildInputDecoration(field.label),
      style: const TextStyle(color: Colors.white),
    );
  }

  InputDecoration _buildInputDecoration(String label, {bool isDate = false}) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      labelStyle: const TextStyle(color: Colors.grey),
      suffixIcon: isDate
          ? const Icon(Icons.calendar_today, color: Colors.grey, size: 20)
          : null,
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
    );
  }
}
