import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'company_jobs_list_events.dart';
import 'company_jobs_list_states.dart';
import '/data/data.dart';


class CompanyJobsListBloc extends Bloc<CompanyJobsListEvent, CompanyJobsListState> {

  final JobsRepository jobsRepository;

  CompanyJobsListBloc(
    this.jobsRepository,
  ) : super(CompanyJobsListInitState()) {
    on<UpdateCompanyJobsListEvent>(onCompanyJobsListEvent);
  }

  Future<void> onCompanyJobsListEvent(
      UpdateCompanyJobsListEvent event,
      Emitter<CompanyJobsListState> emit,
      ) async {
    final jobs = await jobsRepository.getJobsForCompany(event.companyId);
    emit(CompanyJobsListLoadedState(jobs));
  }
}