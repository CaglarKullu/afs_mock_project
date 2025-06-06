import 'package:afs_mock_project/common/controllers/error_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorBanner extends ConsumerWidget {
  const ErrorBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(errorControllerProvider);

    if (error == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 8,
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          title: Text(
            error,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => ref.read(errorControllerProvider.notifier).clear(),
          ),
        ),
      ),
    );
  }
}
