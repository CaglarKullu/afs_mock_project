import 'package:flutter/material.dart';

enum JobStatus {
  pending,
  inProgress,
  completed;
}

extension JobStatusColor on JobStatus {
  Color get color => switch (this) {
        JobStatus.pending => Colors.orange,
        JobStatus.inProgress => Colors.blue,
        JobStatus.completed => Colors.green,
      };
}

extension JobStatusLabel on JobStatus {
  String get label => switch (this) {
        JobStatus.pending => 'Pending',
        JobStatus.inProgress => 'In Progress',
        JobStatus.completed => 'Completed',
      };
}

extension JobStatusIconData on JobStatus {
  IconData get iconData => switch (this) {
        JobStatus.pending => Icons.hourglass_empty,
        JobStatus.inProgress => Icons.build_circle,
        JobStatus.completed => Icons.check_circle,
      };
}

extension JobStatusFromString on JobStatus {
  static JobStatus fromString(String value) => switch (value.toLowerCase()) {
        'inprogress' => JobStatus.inProgress,
        'completed' => JobStatus.completed,
        _ => JobStatus.pending,
      };
}
