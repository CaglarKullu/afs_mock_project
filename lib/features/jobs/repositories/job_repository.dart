import 'dart:convert';
import 'package:afs_mock_project/common/config/environment.dart';
import 'package:http/http.dart' as http;
import '../models/job_model.dart';

class JobRepository {
  static final _baseUrl = Environment.baseUrl;

  Future<List<JobModel>> fetchJobs() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => JobModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<JobModel> createJob(JobModel job) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      body: jsonEncode(job.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return JobModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create job');
    }
  }

  Future<JobModel> updateJob(JobModel job) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/${job.id}'),
      body: jsonEncode(job.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return JobModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update job');
    }
  }

  Future<void> deleteJob(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete job');
    }
  }
}
