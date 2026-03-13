import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:flutter/material.dart';

class ServiceQueueCard extends StatelessWidget {
  final String jobId;
  final String status;
  final String? description;
  final String? customerName;
  final String? carNumber;
  final String? carModelCode;
  final bool isOpacityReduced;
  final VoidCallback? onTap;

  const ServiceQueueCard({
    super.key,
    required this.jobId,
    required this.status,
    this.description,
    this.customerName,
    this.carNumber,
    this.carModelCode,
    this.isOpacityReduced = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isOpacityReduced ? 0.5 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C), // card-dark from design
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Highlight Bar
                Container(
                  width: 6,
                  color: _getStatusColor(status),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                (customerName ?? '고객 미등록').toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  height: 1.0,
                                  letterSpacing: -0.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _buildStatusChip(status),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.directions_car,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            if (carNumber != null)
                              Text(
                                carNumber!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            if (carNumber != null && carModelCode != null)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '|',
                                  style: TextStyle(color: Color(0xFF444444), fontSize: 14),
                                ),
                              ),
                            if (carModelCode != null)
                              Flexible(
                                child: Text(
                                  carModelCode!,
                                  style: const TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                        if (description != null && description!.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            description!,
                            style: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        const SizedBox(height: 12),
                        Text(
                          'JOB ID: $jobId',
                          style: const TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'WAITING':
        return Colors.amber;
      case 'IN_PROGRESS':
        return Colors.green;
      case 'COMPLETED':
        return Colors.blue;
      case 'CANCELED':
        return Colors.red;
      case 'REPORT_GENERATING':
        return Colors.orange;
      case 'REPORT_COMPLETED':
        return AppColors.primary;
      case 'REPORT_FAILED':
        return Colors.redAccent;
      default:
        return AppColors.primary;
    }
  }

  Widget _buildStatusChip(String status) {
    String text;
    Color color = _getStatusColor(status);

    switch (status.toUpperCase()) {
      case 'WAITING':
        text = '대기 중';
        break;
      case 'IN_PROGRESS':
        text = '작업 중';
        break;
      case 'COMPLETED':
        text = '완료';
        break;
      case 'CANCELED':
        text = '취소됨';
        break;
      case 'REPORT_GENERATING':
        text = '생성 중';
        break;
      case 'REPORT_COMPLETED':
        text = '완료됨'; // 소견서 완료
        break;
      case 'REPORT_FAILED':
        text = '실패';
        break;
      default:
        text = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
