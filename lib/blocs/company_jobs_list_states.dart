import '/data/data.dart';

abstract class CompanyJobsListState {}

class CompanyJobsListInitState extends CompanyJobsListState {}

class CompanyJobsListLoadedState implements CompanyJobsListState {
  final List<Job> jobs;

  CompanyJobsListLoadedState(this.jobs);
}