import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'jobs_list_events.dart';
import 'jobs_list_states.dart';
import '/data/data.dart';


class JobsListBloc extends Bloc<JobsListEvent, JobsListState> {

  final JobsRepository jobsRepository;
  final CompaniesRepository companiesRepository;

  JobsListBloc(
    this.jobsRepository,
    this.companiesRepository
  ) : super(JobsListInitState()) {
    on<UpdateJobsListEvent>(onJobsListEvent);
    on<AddJobEvent>(onAddJobEvent);
  }

  Future<void> onJobsListEvent(
      UpdateJobsListEvent event,
      Emitter<JobsListState> emit,
      ) async {
    final jobs = await jobsRepository.getJobs();
    final companies = await companiesRepository.getCompanies();
    emit(JobsListLoadedState(jobs, companies));
  }

  Future<void> onAddJobEvent(
      AddJobEvent event,
      Emitter<JobsListState> emit,
      ) async {
    await jobsRepository.postJob(event.newJob);
    final jobs = await jobsRepository.getJobs();
    final companies = await companiesRepository.getCompanies();
    emit(JobsListLoadedState(jobs, companies));
  }
}