enum JobStatus {
  pending,
  inProgress,
  completed;

  String get label => switch (this) {
        JobStatus.pending => 'Pending',
        JobStatus.inProgress => 'In Progress',
        JobStatus.completed => 'Completed',
      };

  static JobStatus fromString(String value) => switch (value.toLowerCase()) {
        'inprogress' => JobStatus.inProgress,
        'completed' => JobStatus.completed,
        _ => JobStatus.pending,
      };
}
