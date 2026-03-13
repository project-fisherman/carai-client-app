import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: InkWell(
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '조회 날짜',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '날짜 선택',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    _dateString,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.calendar_today_rounded, color: AppColors.primary, size: 20),
                ],
              ),
            ],
          ),
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
      padding: const EdgeInsets.all(20),
      itemCount: history.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = history[index];
        final statusColor = item.toStatus != null ? _getStatusColor(item.toStatus!) : AppColors.primary;
        
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
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
                Container(
                  width: 6,
                  color: statusColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _translateAction(item.action).toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '작업자: ${item.actorUserId}',
                          style: const TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (item.fromStatus != null || item.toStatus != null)
                          Row(
                            children: [
                              if (item.fromStatus != null) ...[
                                _buildStatusChip(item.fromStatus!),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Icon(
                                    Icons.east_rounded,
                                    color: Color(0xFF444444),
                                    size: 16,
                                  ),
                                ),
                              ],
                              if (item.toStatus != null) _buildStatusChip(item.toStatus!),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
      case 'PENDING':
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
        text = '완료됨';
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
