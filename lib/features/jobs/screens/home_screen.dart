import 'package:afs_mock_project/common/theme/theme_provider.dart';
import 'package:afs_mock_project/features/jobs/widgets/job_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/job_form.dart';
import '../../../common/widgets/error_banner.dart';
import '../../../common/widgets/success_toast.dart';
import '../../../common/utils/responsive.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = Responsive.getContentWidth(context);
    final themeMode = ref.watch(themeControllerProvider);
    final themeNotifier = ref.read(themeControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AFS Jobs'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode.mode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: 'Toggle Theme',
            onPressed: () => themeNotifier.toggle(),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: width,
          child: const Column(
            children: [
              ErrorBanner(),
              SuccessToast(),
              JobForm(),
              Expanded(child: JobListScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
