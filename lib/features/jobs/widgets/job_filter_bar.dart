import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afs_mock_project/features/jobs/index.dart';

class JobFilterBar extends ConsumerWidget {
  const JobFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterStateProvider);
    final filterNotifier = ref.read(filterStateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search by title',
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              filterNotifier.state = filter.copyWith(searchQuery: query);
            },
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilterChip(
                label: const Text('All'),
                selected: filter.status == null,
                onSelected: (_) =>
                    filterNotifier.state = filter.copyWith(status: null),
              ),
              ...JobStatus.values.map(
                (status) => FilterChip(
                  label: Text(status.label),
                  selected: filter.status == status,
                  onSelected: (_) =>
                      filterNotifier.state = filter.copyWith(status: status),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                filterNotifier.state = FilterState(); // reset
              },
              icon: const Icon(Icons.clear),
              label: const Text("Clear Filters"),
            ),
          ),
        ],
      ),
    );
  }
}
