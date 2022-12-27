import '/data/data.dart';

abstract class CompaniesListState {}

class CompaniesListInitState extends CompaniesListState {}

class CompaniesListLoadedState implements CompaniesListState {
  final List<Company> companies;

  CompaniesListLoadedState(this.companies);
}