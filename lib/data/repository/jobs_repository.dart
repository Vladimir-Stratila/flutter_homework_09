import '/data/data.dart';

abstract class JobsRepository {
  Future<List<Job>> getJobs();
  Future<List<Job>> getJobsForCompany(int companyId);
  Future<int> postJob(Job job);
  Future<int> deleteJob(int id);
}