import '/data/data.dart';

abstract class JobsListEvent {}

class JobsListInitEvent extends JobsListEvent {}

class UpdateJobsListEvent extends JobsListEvent {

  UpdateJobsListEvent();
}

class AddJobEvent extends JobsListEvent {
  final Job newJob;

  AddJobEvent(this.newJob);
}