import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'companies_list_events.dart';
import 'companies_list_states.dart';
import '/data/data.dart';


class CompaniesListBloc extends Bloc<CompaniesListEvent, CompaniesListState> {

  final CompaniesRepository companiesRepository;

  CompaniesListBloc(this.companiesRepository) : super(CompaniesListInitState()) {
    on<UpdateCompaniesListEvent>(onCompaniesListEvent);
    on<AddCompanyEvent>(onAddCompanyEvent);
  }

  Future<void> onCompaniesListEvent(
      UpdateCompaniesListEvent event,
      Emitter<CompaniesListState> emit,
      ) async {
    final result = await companiesRepository.getCompanies();
    emit(CompaniesListLoadedState(result));
  }

  Future<void> onAddCompanyEvent(
      AddCompanyEvent event,
      Emitter<CompaniesListState> emit,
      ) async {
    await companiesRepository.postCompany(event.newCompany);
    final result = await companiesRepository.getCompanies();
    emit(CompaniesListLoadedState(result));
  }
}