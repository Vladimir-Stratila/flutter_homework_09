import '/data/data.dart';
import 'package:dio/dio.dart';
import '/remote/mapper/jobs_mapper.dart';
import '/remote/model/jobs_response.dart';

const jobsUrl = '3.75.134.87';
const jobsPath = '/flutter/v1/jobs';
const compPath = '/flutter/v1/companies';

class JobsRemoteRepository implements JobsRepository {
  final Dio client;

  JobsRemoteRepository(this.client);

  @override
  Future<List<Job>> getJobs() async {
    var uri = Uri.http(jobsUrl, jobsPath);
    var response = await client.getUri(uri);
    if (response.statusCode == 200) {
      JobsResponse apiResponse = JobsResponse.fromJson(response.data);
      return JobsMapper().map(apiResponse.result);
    }
    return [];
  }

  @override
  Future<List<Job>> getJobsForCompany(int companyId) async {
    var uri = Uri.http(jobsUrl, '$compPath/$companyId/jobs');
    var response = await client.getUri(uri);
    if (response.statusCode == 200) {
      JobsResponse apiResponse = JobsResponse.fromJson(response.data);
      return JobsMapper().map(apiResponse.result);
    }
    return [];
  }

  @override
  Future<int> postJob(Job job) async {
    var uri = Uri.http(jobsUrl, jobsPath);
    var response = await client.postUri(
      uri,
      data: {'title': job.title,
        'description': job.description,
        'city': job.city,
        'companyId': job.companyId
      }
    );
    if (response.statusCode == 200) {
      return response.data.values.first;
    }
    return 0;
  }

  @override
  Future<int> deleteJob(int id) async {
    var uri = Uri.http(jobsUrl, '$jobsPath/$id');
    var response = await client.postUri(uri);
    if (response.statusCode == 200) {
      return response.data.values.first;
    }
    return 0;
  }
}