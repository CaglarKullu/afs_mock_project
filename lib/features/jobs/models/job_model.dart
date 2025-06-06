import 'package:afs_mock_project/features/jobs/models/job_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'job_model.freezed.dart';
part 'job_model.g.dart';

@Freezed(toJson: true)
abstract class JobModel with _$JobModel {
  const factory JobModel({
    required String id,
    required String title,
    required JobStatus status,
  }) = _JobModel;
  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}
