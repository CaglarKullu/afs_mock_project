import 'package:afs_mock_project/features/jobs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobCard extends ConsumerWidget {
  final JobModel job;
  final VoidCallback confirmDelete;
  const JobCard({required this.job, required this.confirmDelete, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(job.title),
        subtitle: Text(job.status.label),
        leading: Icon(
          job.status.iconData,
          color: job.status.color,
        ),
        trailing: Wrap(
          spacing: 12,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              tooltip: 'Edit',
              onPressed: () {
                ref.read(selectedJobProvider.notifier).state = job;
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Delete',
              onPressed: () => confirmDelete,
            ),
          ],
        ),
      ),
    );
  }
}
