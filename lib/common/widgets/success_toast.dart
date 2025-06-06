import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/success_controller.dart';

class SuccessToast extends ConsumerWidget {
  const SuccessToast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(successControllerProvider);

    if (message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green[600],
            duration: const Duration(seconds: 2),
          ),
        );
        ref.read(successControllerProvider.notifier).clear();
      });
    }

    return const SizedBox.shrink();
  }
}
