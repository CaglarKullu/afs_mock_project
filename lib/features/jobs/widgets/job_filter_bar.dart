import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afs_mock_project/features/jobs/index.dart';

class JobFilterBar extends ConsumerStatefulWidget {
  const JobFilterBar({super.key});

  @override
  ConsumerState<JobFilterBar> createState() => _JobFilterBarState();
}

class _JobFilterBarState extends ConsumerState<JobFilterBar> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(filterStateProvider);
    final filterNotifier = ref.read(filterStateProvider.notifier);
    final chipTheme = Theme.of(context).chipTheme;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search by title',
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (query) {
              filterNotifier.state = filter.copyWith(searchQuery: query);
            },
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CustomFilterChip(
                label: 'All',
                selected: filter.status == null,
                onTap: () =>
                    filterNotifier.state = filter.copyWith(status: null),
                chipTheme: chipTheme,
              ),
              ...JobStatus.values.map(
                (status) => CustomFilterChip(
                  label: status.label,
                  selected: filter.status == status,
                  onTap: () =>
                      filterNotifier.state = filter.copyWith(status: status),
                  chipTheme: chipTheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                _searchController.clear();
                filterNotifier.state = FilterState();
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
