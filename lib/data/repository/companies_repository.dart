import '/data/data.dart';

abstract class CompaniesRepository {
  Future<List<Company>> getCompanies();
  Future<int> postCompany(Company company);
  Future<int> deleteCompany(int id);
}