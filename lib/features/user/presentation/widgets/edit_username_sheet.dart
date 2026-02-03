import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../design_system/atoms/app_button.dart';
import '../../../../design_system/atoms/app_input.dart';
import '../../../../design_system/foundations/app_colors.dart';
import '../providers/user_notifier.dart';

class EditUsernameSheet extends ConsumerStatefulWidget {
  final String initialName;

  const EditUsernameSheet({super.key, required this.initialName});

  @override
  ConsumerState<EditUsernameSheet> createState() => _EditUsernameSheetState();
}

class _EditUsernameSheetState extends ConsumerState<EditUsernameSheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final newName = _controller.text.trim();
    if (newName.isEmpty) return;
    if (newName == widget.initialName) {
      Navigator.pop(context);
      return;
    }

    await ref.read(userNotifierProvider.notifier).updateName(newName);

    // Check if mounted before internal navigation
    if (mounted) {
      // Ideally we check for error state here, but for simple sheet, closing on completion is fine
      // or we can wait to see if state is error.
      // The notifier updates the state.
      final state = ref.read(userNotifierProvider);
      if (!state.hasError) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update: ${state.error}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userNotifierProvider);
    final isLoading = state.isLoading;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Edit Username',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          AppInput(
            label: 'Username',
            placeholder: 'Enter new username',
            controller: _controller,
            enabled: !isLoading,
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'SAVE',
            onPressed: isLoading ? () {} : _save,
            isLoading: isLoading,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
