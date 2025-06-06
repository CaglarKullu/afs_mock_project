import 'package:afs_mock_project/common/controllers/error_controller.dart';
import 'package:afs_mock_project/common/controllers/success_controller.dart';
import 'package:afs_mock_project/features/jobs/repositories/job_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/job_model.dart';
import '../models/job_status.dart';
import 'filter_state_provider.dart';

final jobNotifierProvider =
    StateNotifierProvider<JobNotifier, AsyncValue<List<JobModel>>>(
  (ref) => JobNotifier(ref),
);

final filteredJobsProvider = Provider<List<JobModel>>((ref) {
  final filter = ref.watch(filterStateProvider);
  final jobsState = ref.watch(jobNotifierProvider);

  return jobsState.maybeWhen(
    data: (jobs) {
      return jobs.where((job) {
        final matchesQuery =
            job.title.toLowerCase().contains(filter.searchQuery.toLowerCase());
        final matchesStatus =
            filter.status == null || job.status == filter.status;
        return matchesQuery && matchesStatus;
      }).toList();
    },
    orElse: () => [],
  );
});

class JobNotifier extends StateNotifier<AsyncValue<List<JobModel>>> {
  final Ref ref;
  final JobRepository _repo = JobRepository();
  final Uuid uuid = Uuid();

  JobNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    try {
      final jobs = await _repo.fetchJobs();
      state = AsyncValue.data(jobs);
    } catch (e) {
      ref.read(errorControllerProvider.notifier).set(e.toString());
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addJob(String title, JobStatus status) async {
    final newJob = JobModel(
      id: uuid.v4(),
      title: title,
      status: status,
    );

    try {
      final created = await _repo.createJob(newJob);
      final current = state.value ?? [];
      state = AsyncValue.data([...current, created]);
      ref.read(successControllerProvider.notifier).set("Job added");
    } catch (e) {
      ref.read(errorControllerProvider.notifier).set(e.toString());
    }
  }

  Future<void> updateJob(JobModel updatedJob) async {
    try {
      final updated = await _repo.updateJob(updatedJob);
      final current = [...?state.value];
      final index = current.indexWhere((j) => j.id == updated.id);
      if (index != -1) current[index] = updated;
      state = AsyncValue.data(current);
      ref.read(successControllerProvider.notifier).set("Job updated");
    } catch (e) {
      ref.read(errorControllerProvider.notifier).set(e.toString());
    }
  }

  Future<void> deleteJob(String id) async {
    try {
      await _repo.deleteJob(id);
      final current = state.value ?? [];
      state = AsyncValue.data(current.where((j) => j.id != id).toList());
      ref.read(successControllerProvider.notifier).set("Job deleted");
    } catch (e) {
      ref.read(errorControllerProvider.notifier).set(e.toString());
    }
  }
}
