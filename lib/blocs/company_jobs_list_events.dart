abstract class CompanyJobsListEvent {}

class CompanyJobsListInitEvent extends CompanyJobsListEvent {}

class UpdateCompanyJobsListEvent extends CompanyJobsListEvent {
  final int companyId;

  UpdateCompanyJobsListEvent(this.companyId);
}