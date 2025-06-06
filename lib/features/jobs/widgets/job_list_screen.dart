import 'package:afs_mock_project/features/jobs/models/job_status.dart';
import 'package:afs_mock_project/features/jobs/providers/job_notifier.dart';
import 'package:afs_mock_project/features/jobs/providers/selected_job_provider.dart';
import 'package:afs_mock_project/common/widgets/error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/job_model.dart';

class JobListScreen extends ConsumerWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobState = ref.watch(jobNotifierProvider);
    final jobNotifier = ref.read(jobNotifierProvider.notifier);

    return jobState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => ErrorBanner(),
      data: (jobs) {
        if (jobs.isEmpty) {
          return const Center(child: Text('No jobs available.'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: jobs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final job = jobs[index];
            return Card(
              child: ListTile(
                title: Text(job.title),
                subtitle: Text(job.status.label),
                leading: Icon(
                  _statusIcon(job.status),
                  color: _statusColor(job.status),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blueAccent),
                      tooltip: 'Edit',
                      onPressed: () {
                        ref.read(selectedJobProvider.notifier).state = job;
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Delete',
                      onPressed: () =>
                          _confirmDelete(context, jobNotifier, job),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _confirmDelete(
      BuildContext context, JobNotifier jobNotifier, JobModel job) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete Job"),
        content: Text("Are you sure you want to delete '${job.title}'?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              jobNotifier.deleteJob(job.id);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  IconData _statusIcon(JobStatus status) => switch (status) {
        JobStatus.pending => Icons.hourglass_empty,
        JobStatus.inProgress => Icons.build_circle,
        JobStatus.completed => Icons.check_circle,
      };

  Color _statusColor(JobStatus status) => switch (status) {
        JobStatus.pending => Colors.orange,
        JobStatus.inProgress => Colors.blue,
        JobStatus.completed => Colors.green,
      };
}
