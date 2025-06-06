import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:afs_mock_project/features/jobs/index.dart';

class JobFilterBar extends ConsumerWidget {
  const JobFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _buildChip(
                label: 'All',
                selected: filter.status == null,
                onTap: () =>
                    filterNotifier.state = filter.copyWith(status: null),
                chipTheme: chipTheme,
              ),
              ...JobStatus.values.map(
                (status) => _buildChip(
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
              onPressed: () => filterNotifier.state = FilterState(),
              icon: const Icon(Icons.clear),
              label: const Text("Clear Filters"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    required ChipThemeData chipTheme,
  }) {
    return FilterChip(
      label: Text(
        label,
        style: selected ? chipTheme.secondaryLabelStyle : chipTheme.labelStyle,
      ),
      selected: selected,
      selectedColor: chipTheme.selectedColor,
      backgroundColor: chipTheme.backgroundColor,
      shape: chipTheme.shape,
      onSelected: (_) => onTap(),
    );
  }
}
