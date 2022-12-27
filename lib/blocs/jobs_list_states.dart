import '/data/data.dart';

abstract class JobsListState {}

class JobsListInitState extends JobsListState {}

class JobsListLoadedState implements JobsListState {
  final List<Job> jobs;
  final List<Company> companies;

  JobsListLoadedState(this.jobs, this.companies);
}