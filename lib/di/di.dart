import '/blocs/company_jobs_list_bloc.dart';
import '/blocs/companies_list_bloc.dart';
import '/blocs/jobs_list_bloc.dart';
import '/data/data.dart';
import 'package:dio/dio.dart';
import 'package:injector/injector.dart' show Injector;
import '/remote/remote.dart';

class Di {
  static final Di _instance = Di._internal();

  factory Di() => _instance;

  Di._internal();

  Future<void> setup() async {
    Injector.appInstance
      ..registerDependency<JobsListBloc>(
            () => JobsListBloc(
          Injector.appInstance.get<JobsRepository>(),
          Injector.appInstance.get<CompaniesRepository>(),
        ),
      )
      ..registerDependency<CompaniesListBloc>(
            () => CompaniesListBloc(
          Injector.appInstance.get<CompaniesRepository>(),
        ),
      )
      ..registerDependency<CompanyJobsListBloc>(
            () => CompanyJobsListBloc(
          Injector.appInstance.get<JobsRepository>(),
        ),
      )
      ..registerDependency<JobsRepository>(
            () => JobsRemoteRepository(
          Injector.appInstance.get<Dio>(),
        ),
      )
      ..registerDependency<CompaniesRepository>(
            () => CompaniesRemoteRepository(
          Injector.appInstance.get<Dio>(),
        ),
      )
      ..registerSingleton<Dio>(
            () => DioClientFactory().getClient(),
      );
  }
}