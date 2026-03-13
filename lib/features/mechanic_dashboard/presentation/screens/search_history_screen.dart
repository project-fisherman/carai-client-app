import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/job_history_view_model.dart';
import '../../data/dtos/repair_job_dtos.dart';

class SearchHistoryScreen extends ConsumerStatefulWidget {
  final String shopId;

  const SearchHistoryScreen({super.key, required this.shopId});

  @override
  ConsumerState<SearchHistoryScreen> createState() => _SearchHistoryScreenState();
}

class _SearchHistoryScreenState extends ConsumerState<SearchHistoryScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  String get _dateString => DateFormat('yyyy-MM-dd').format(_selectedDate);

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(jobHistoryViewModelProvider(
      shopId: widget.shopId,
      date: _dateString,
    ));

    return AppScaffold(
      appBar: const AppNavigationBar(
        title: '작업 히스토리',
      ),
      body: Column(
        children: [
          _buildDatePicker(),
          const Divider(height: 1, color: AppColors.border),
          Expanded(
            child: historyAsync.when(
              data: (history) => _buildHistoryList(history),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (err, stack) => const Center(
                child: Text('히스토리를 불러오지 못했습니다.',
                    style: TextStyle(color: Colors.red)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: AppColors.primary,
                  onPrimary: AppColors.textLight,
                  surface: AppColors.backgroundDark,
                  onSurface: AppColors.textLight,
                ),
              ),
              child: child!,
            );
          },
        );

        if (date != null && date != _selectedDate) {
          setState(() {
            _selectedDate = date;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(color: AppColors.backgroundDark),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '날짜 선택',
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  _dateString,
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList(List<RepairJobHistoryResponseDto> history) {
    if (history.isEmpty) {
      return const Center(
        child: Text(
          '선택한 날짜에 기록이 없습니다.',
          style: TextStyle(color: AppColors.textLight, fontSize: 16),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: history.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = history[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '동작: ${_translateAction(item.action)}',
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '작업자: ${item.assigneeUserId != null ? item.actorUserId : "미지정"}', // Would ideally map user ID to name, showing ID for now or actor
                    style: const TextStyle(color: AppColors.textLight, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (item.fromStatus != null || item.toStatus != null)
                Row(
                  children: [
                    if (item.fromStatus != null) ...[
                      _buildStatusChip(item.fromStatus!),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.arrow_forward_rounded, color: AppColors.textLight, size: 16),
                      ),
                    ],
                    if (item.toStatus != null) _buildStatusChip(item.toStatus!),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  String _translateAction(String action) {
    switch (action.toUpperCase()) {
      case 'CREATED':
        return '작업 생성';
      case 'UPDATED':
        return '정보 수정';
      case 'STATUS_CHANGED':
        return '상태 변경';
      case 'ASSIGN':
        return '작업 할당';
      case 'WAITING':
        return '대기 중';
      case 'DELETED':
        return '작업 삭제';
      default:
        return action;
    }
  }

  Widget _buildStatusChip(String status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status.toUpperCase()) {
      case 'PENDING':
      case 'WAITING':
        bgColor = AppColors.surfaceDark;
        textColor = AppColors.textLight;
        text = '대기 중';
        break;
      case 'IN_PROGRESS':
        bgColor = AppColors.primary.withAlpha(51); // 0.2 opacity
        textColor = AppColors.primary;
        text = '진행 중';
        break;
      case 'COMPLETED':
        bgColor = Colors.blue.withAlpha(51);
        textColor = Colors.blue;
        text = '작업 완료';
        break;
      case 'CANCELED':
        bgColor = Colors.red.withAlpha(51);
        textColor = Colors.red;
        text = '작업 취소';
        break;
      case 'REPORT_GENERATING':
        bgColor = Colors.orange.withAlpha(51);
        textColor = Colors.orange;
        text = '소견서 생성 중';
        break;
      case 'REPORT_COMPLETED':
        bgColor = Colors.green.withAlpha(51);
        textColor = Colors.green;
        text = '소견서 생성 완료';
        break;
      case 'REPORT_FAILED':
        bgColor = Colors.red.withAlpha(51);
        textColor = Colors.red;
        text = '소견서 실패';
        break;
      default:
        bgColor = AppColors.surfaceDark;
        textColor = AppColors.textLight;
        text = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
