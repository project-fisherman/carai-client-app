import 'package:flutter/material.dart';

class ServiceQueueCard extends StatelessWidget {
  final int jobId;
  final String status;
  final String? description;
  final bool isOpacityReduced;

  const ServiceQueueCard({
    super.key,
    required this.jobId,
    required this.status,
    this.description,
    this.isOpacityReduced = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isOpacityReduced ? 0.5 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF292524), // bg-stone-800
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF44403C), // border-stone-700
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job ID and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Job #$jobId',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                _buildStatusChip(status),
              ],
            ),
            if (description != null && description!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                description!,
                style: const TextStyle(
                  color: Color(0xFFA8A29E), // text-stone-400
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color backgroundColor;
    Color textColor;
    String displayText;

    switch (status.toUpperCase()) {
      case 'WAITING':
        backgroundColor = const Color(0xFFFEF3C7); // bg-amber-100
        textColor = const Color(0xFF92400E); // text-amber-800
        displayText = 'Waiting';
        break;
      case 'IN_PROGRESS':
        backgroundColor = const Color(0xFFDCFCE7); // bg-green-100
        textColor = const Color(0xFF166534); // text-green-800
        displayText = 'In Progress';
        break;
      case 'COMPLETED':
        backgroundColor = const Color(0xFFE0E7FF); // bg-indigo-100
        textColor = const Color(0xFF3730A3); // text-indigo-800
        displayText = 'Completed';
        break;
      case 'CANCELED':
        backgroundColor = const Color(0xFFFEE2E2); // bg-red-100
        textColor = const Color(0xFF991B1B); // text-red-800
        displayText = 'Canceled';
        break;
      default:
        backgroundColor = const Color(0xFFF5F5F4); // bg-stone-100
        textColor = const Color(0xFF292524); // text-stone-800
        displayText = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
