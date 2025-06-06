import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/job_model.dart';

final selectedJobProvider = StateProvider<JobModel?>((ref) => null);
