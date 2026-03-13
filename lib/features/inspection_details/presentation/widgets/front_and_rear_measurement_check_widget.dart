import 'package:flutter/material.dart';
import 'good_warning_check_widget.dart';

class FrontAndRearMeasurementCheckWidget extends StatelessWidget {
  final String methodTemplate; // e.g., "트레드 깊이 (앞 %smm, 뒤 %smm)"
  final Map<String, dynamic>? value;
  final ValueChanged<Map<String, dynamic>> onChanged;

  const FrontAndRearMeasurementCheckWidget({
    super.key,
    required this.methodTemplate,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Split by <br> to handle multi-line methods (e.g. "Tread Depth... <br> Tire Pressure...")
    final lines = methodTemplate.split('<br>');

    // We will build a list of widgets to render
    List<Widget> children = [];

    // Basic Checks (Good/Warn) - Unified style with BasicCheckWidget
    children.add(GoodWarningCheckWidget(value: value, onChanged: onChanged));
    children.add(const SizedBox(height: 16));

    for (final line in lines) {
      final cleanLine = line.trim();
      if (cleanLine.isEmpty) continue;

      // 2. Try to match the standard pattern: "Title (Front %s[Unit], Rear %s[Unit])"
      // Regex explanation:
      // (.*)             -> Group 1: Title (e.g. "트레드 깊이")
      // \(앞\s*%s([^,]*),\s*뒤\s*%s([^)]*)\) -> Matches "(앞 %s..., 뒤 %s...)"
      //    [^,]*         -> Group 2: Front Unit (text after %s until comma)
      //    [^)]*         -> Group 3: Rear Unit (text after %s until closing paren)
      final regex = RegExp(r"(.*)\(앞\s*%s([^,]*),\s*뒤\s*%s([^)]*)\)");
      final match = regex.firstMatch(cleanLine);

      if (match != null) {
        // Standard Format Matched
        final title = match.group(1)?.trim() ?? "";
        final frontUnit = match.group(2)?.trim() ?? "";
        final rearUnit = match.group(3)?.trim() ?? "";

        // Render Title if present
        if (title.isNotEmpty) {
          children.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
          );
        }

        // Render Inputs
        children.add(_buildMeasurementRow("앞 (Front)", 'value_1', frontUnit));
        children.add(const SizedBox(height: 8));
        children.add(_buildMeasurementRow("뒤 (Rear)", 'value_2', rearUnit));
        children.add(const SizedBox(height: 12)); // Spacing after inputs
      } else {
        // 3. Fallback: Just render the text line as description
        // This covers "Tire Pressure..." or lines that don't need inputs
        children.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              cleanLine,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildMeasurementRow(String label, String key, String unit) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2C),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                        TextEditingController(
                            text: value?[key]?.toString() ?? '',
                          )
                          ..selection = TextSelection.fromPosition(
                            TextPosition(
                              offset: (value?[key]?.toString() ?? '').length,
                            ),
                          ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: (v) {
                      final newValue = Map<String, dynamic>.from(value ?? {});
                      newValue[key] = num.tryParse(v) ?? v;
                      onChanged(newValue);
                    },
                  ),
                ),
                Text(unit, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
