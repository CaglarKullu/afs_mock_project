import 'package:afs_mock_project/features/jobs/models/job_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterState {
  final String searchQuery;
  final JobStatus? status;

  FilterState({this.searchQuery = '', this.status});

  FilterState copyWith({
    String? searchQuery,
    Object? status = _noChange,
  }) {
    return FilterState(
      searchQuery: searchQuery ?? this.searchQuery,
      status: status == _noChange ? this.status : status as JobStatus?,
    );
  }

  static const _noChange = Object();
}

final filterStateProvider = StateProvider<FilterState>((ref) => FilterState());
