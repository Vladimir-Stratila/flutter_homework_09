import '/data/data.dart';

abstract class CompaniesListEvent {}

class CompaniesListInitEvent extends CompaniesListEvent {}

class UpdateCompaniesListEvent extends CompaniesListEvent {

  UpdateCompaniesListEvent();
}

class AddCompanyEvent extends CompaniesListEvent {
  final Company newCompany;

  AddCompanyEvent(this.newCompany);
}