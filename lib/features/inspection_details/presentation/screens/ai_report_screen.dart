import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../../../../design_system/molecules/app_navigation_bar.dart';
import '../../../../design_system/molecules/app_scaffold.dart';
import '../viewmodels/ai_report_view_model.dart';
import '../../../mechanic_dashboard/presentation/providers/mechanic_dashboard_view_model.dart';

class AiReportScreen extends ConsumerWidget {
  final String jobId;

  const AiReportScreen({super.key, required this.jobId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(aiReportViewModelProvider(jobId));

    return AppScaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppNavigationBar(
        title: 'AI 점검 소견서',
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textLight),
          onPressed: () {
            ref.read(dashboardRefreshSignalProvider.notifier).state++;
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: reportAsync.when(
                data: (reportState) {
                  if (reportState.reportUrl != null) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.picture_as_pdf, color: AppColors.primary, size: 64),
                            const SizedBox(height: 24),
                            const Text(
                              'AI 소견서 생성이 완료되었습니다.',
                              style: TextStyle(color: AppColors.textLight, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton.icon(
                              onPressed: () async {
                                final uri = Uri.parse(reportState.reportUrl!);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('PDF를 열 수 없습니다.')),
                                    );
                                  }
                                }
                              },
                              icon: const Icon(Icons.file_open, color: AppColors.textDark),
                              label: const Text('소견서 확인하기 (PDF)', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (reportState.isSent)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.green.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      '고객에게 문자가 전송되었습니다.',
                                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            else
                              ElevatedButton.icon(
                                onPressed: reportState.isSending
                                    ? null
                                    : () async {
                                        try {
                                          await ref
                                              .read(aiReportViewModelProvider(jobId).notifier)
                                              .sendReport();
                                        } catch (e) {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('전송 실패: ${e.toString()}')),
                                            );
                                          }
                                        }
                                      },
                                icon: reportState.isSending
                                    ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppColors.primary,
                                        ),
                                      )
                                    : const Icon(Icons.send_rounded, color: AppColors.primary, size: 20),
                                label: Text(
                                  reportState.isSending ? '전송 중...' : '고객에게 문자 보내기',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.surfaceDark,
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  side: const BorderSide(color: AppColors.primary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  } else if (reportState.isFailed) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 64),
                            const SizedBox(height: 24),
                            const Text(
                              '소견서 생성에 실패했습니다.',
                              style: TextStyle(color: AppColors.textLight, fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '다시 시도해 주세요.',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton.icon(
                              onPressed: () async {
                                await ref
                                    .read(aiReportViewModelProvider(jobId).notifier)
                                    .generateReport();
                              },
                              icon: const Icon(Icons.refresh, color: AppColors.textDark),
                              label: const Text('소견서 재생성', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 16)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (reportState.isGenerating) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: AppColors.primary),
                          SizedBox(height: 24),
                          Text(
                            'AI가 소견서를 작성 중입니다...',
                            style: TextStyle(
                              color: AppColors.textLight,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '잠시만 기다려주세요 (최대 30초 소요)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.auto_awesome, color: AppColors.primary, size: 64),
                            const SizedBox(height: 24),
                            const Text(
                              'AI를 활용하여 점검 소견서를 생성합니다.',
                              style: TextStyle(color: AppColors.textLight, fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '기존 점검 내역을 바탕으로 분석하여\n고객에게 제공할 상세 소견서를 작성합니다.',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed: () async {
                                await ref
                                    .read(aiReportViewModelProvider(jobId).notifier)
                                    .generateReport();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('소견서 생성 시작', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                error: (error, stack) => Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, color: Colors.red, size: 48),
                          const SizedBox(height: 16),
                          Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.textLight, fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => ref.invalidate(aiReportViewModelProvider(jobId)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.surfaceDark,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: const Text('다시 시도', style: TextStyle(color: AppColors.textLight)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Bottom Action Area
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                border: Border(
                  top: BorderSide(
                    color: AppColors.border.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(dashboardRefreshSignalProvider.notifier).state++;
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          '확인',
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
