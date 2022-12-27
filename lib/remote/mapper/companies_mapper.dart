import '/remote/model/companies_response.dart';
import '/data/model/company.dart';


class CompaniesMapper {

  List<Company> map(List<Result>? data) {
    if (data == null) {
      return [];
    }
    return data.map((e) =>
        Company(e.id, e.name, e.description, e.industry ?? '')).toList();
  }
}