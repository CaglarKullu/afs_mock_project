import 'package:afs_mock_project/features/jobs/models/job_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_state.freezed.dart';

@Freezed()
class ItemState with _$ItemState {
  const factory ItemState.initial() = _Initial;
  const factory ItemState.loading() = _Loading;
  const factory ItemState.data(List<JobModel> items) = _Data;
  const factory ItemState.error(Error e) = _Error;
}
