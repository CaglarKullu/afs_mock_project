import 'package:afs_mock_project/features/jobs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobFilterBar extends ConsumerWidget {
  const JobFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterStateProvider);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // 🔍 Search Field
          SizedBox(
            width: 250,
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by title',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                ref.read(filterStateProvider.notifier).state =
                    filter.copyWith(searchQuery: query);
              },
            ),
          ),

          // 🟢 Status Dropdown
          DropdownButton<JobStatus?>(
            value: filter.status,
            hint: const Text("Filter by status"),
            onChanged: (status) {
              ref.read(filterStateProvider.notifier).state =
                  filter.copyWith(status: status);
            },
            items: [
              const DropdownMenuItem<JobStatus?>(
                value: null,
                child: Text('All'),
              ),
              ...JobStatus.values.map(
                (status) => DropdownMenuItem(
                  value: status,
                  child: Text(status.label),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
