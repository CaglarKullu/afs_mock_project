import 'package:afs_mock_project/features/jobs/models/job_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterState {
  final String searchQuery;
  final JobStatus? status;

  FilterState({this.searchQuery = '', this.status});

  FilterState copyWith({String? searchQuery, JobStatus? status}) {
    return FilterState(
      searchQuery: searchQuery ?? this.searchQuery,
      status: status ?? this.status,
    );
  }
}

final filterStateProvider = StateProvider<FilterState>((ref) => FilterState());
