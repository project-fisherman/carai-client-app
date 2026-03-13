import 'package:carai/design_system/molecules/app_navigation_bar.dart';
import 'package:carai/design_system/molecules/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/routes.dart';
import '../providers/checklist_management_view_model.dart';
import '../../domain/entities/safety_checklist.dart';

class ChecklistManagementScreen extends ConsumerStatefulWidget {
  final String shopId;

  const ChecklistManagementScreen({super.key, required this.shopId});

  @override
  ConsumerState<ChecklistManagementScreen> createState() =>
      _ChecklistManagementScreenState();
}

class _ChecklistManagementScreenState
    extends ConsumerState<ChecklistManagementScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedIds = {};
  @override
  Widget build(BuildContext context) {
    final checklistsAsync = ref.watch(shopChecklistsProvider(widget.shopId));

    return AppScaffold(
      appBar: AppNavigationBar(
        title: '점검표 관리',
        actions:
            checklistsAsync.whenOrNull(
              data: (checklists) {
                if (checklists.isEmpty) return null;
                return [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (_isSelectionMode) {
                          _isSelectionMode = false;
                          _selectedIds.clear();
                        } else {
                          _isSelectionMode = true;
                        }
                      });
                    },
                    child: Text(
                      _isSelectionMode ? '취소' : '선택',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ];
              },
            ) ??
            [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '등록된 점검표',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: checklistsAsync.when(
                  data: (checklists) {
                    if (checklists.isEmpty) {
                      return Center(
                        child: Text(
                          '등록된 점검표가 여기에 표시됩니다.',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    return RefreshIndicator(
                      color: const Color(0xFFE65100),
                      backgroundColor: const Color(0xFF2f221a),
                      onRefresh: () async {
                        ref.invalidate(shopChecklistsProvider(widget.shopId));
                        await ref.read(shopChecklistsProvider(widget.shopId).future);
                      },
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo.metrics.pixels >=
                              scrollInfo.metrics.maxScrollExtent - 200) {
                            ref
                                .read(shopChecklistsProvider(widget.shopId).notifier)
                                .loadMore();
                          }
                          return false;
                        },
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: checklists.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final checklist = checklists[index];
                            return _buildChecklistCard(context, checklist);
                          },
                        ),
                      ),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Color(0xFFE65100)),
                  ),
                  error: (err, stack) => Center(
                    child: Text(
                      '오류: $err',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_isSelectionMode && _selectedIds.isEmpty)
                const SizedBox.shrink()
              else
                _buildBottomButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChecklistCard(BuildContext context, SafetyChecklist checklist) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onLongPress: () {
          if (!_isSelectionMode) {
            setState(() {
              _isSelectionMode = true;
              _selectedIds.add(checklist.id);
            });
          }
        },
        onTap: () {
          if (_isSelectionMode) {
            setState(() {
              if (_selectedIds.contains(checklist.id)) {
                _selectedIds.remove(checklist.id);
              } else {
                _selectedIds.add(checklist.id);
              }
            });
          } else {
            // Future feature: detail view or edit. For now, empty or basic preview.
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2f221a),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _selectedIds.contains(checklist.id)
                  ? const Color(0xFFE65100)
                  : const Color(0xFF374151),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (_isSelectionMode) ...[
                Checkbox(
                  value: _selectedIds.contains(checklist.id),
                  activeColor: const Color(0xFFE65100),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedIds.add(checklist.id);
                      } else {
                        _selectedIds.remove(checklist.id);
                      }
                    });
                  },
                ),
                const SizedBox(width: 8),
              ],
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  checklist.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 60,
                    height: 60,
                    color: const Color(0xFF374151),
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  checklist.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    final isDeleteMode = _isSelectionMode && _selectedIds.isNotEmpty;
    final color = isDeleteMode ? Colors.red : const Color(0xFFE65100);
    final text = isDeleteMode ? '선택 삭제' : '점검표 등록';
    final icon = isDeleteMode ? Icons.delete_outline : Icons.playlist_add_check;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            if (_isSelectionMode) {
              if (_selectedIds.isNotEmpty) {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('삭제 확인'),
                    content: Text('${_selectedIds.length}개의 점검표를 삭제하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text(
                          '취소',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          '삭제',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                    backgroundColor: const Color(0xFF2f221a),
                    titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    contentTextStyle: const TextStyle(color: Colors.white),
                  ),
                );

                if (confirm == true && context.mounted) {
                  try {
                    await ref
                        .read(shopChecklistsProvider(widget.shopId).notifier)
                        .removeChecklists(
                          shopId: widget.shopId,
                          checklistIds: _selectedIds.toList(),
                        );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('점검표가 삭제되었습니다.')),
                      );
                      setState(() {
                        _isSelectionMode = false;
                        _selectedIds.clear();
                      });
                    }
                  } catch (e) {
                    // Error is handled globally by Dio Interceptor
                  }
                }
              }
            } else {
              ChecklistSelectionRoute(shopId: widget.shopId).push(context);
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
