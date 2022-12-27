import '/data/data.dart';
import 'package:dio/dio.dart';
import '/remote/mapper/companies_mapper.dart';
import '/remote/model/companies_response.dart';


const companiesUrl = '3.75.134.87';
const companiesPath = '/flutter/v1/companies';

class CompaniesRemoteRepository implements CompaniesRepository {
  final Dio client;

  CompaniesRemoteRepository(this.client);

  @override
  Future<List<Company>> getCompanies() async {
    var uri = Uri.http(companiesUrl, companiesPath);
    var response = await client.getUri(uri);
    if (response.statusCode == 200) {
      CompaniesResponse apiResponse = CompaniesResponse.fromJson(response.data);
      return CompaniesMapper().map(apiResponse.result);
    }
    return [];
  }

  @override
  Future<int> postCompany(Company company) async {
    var uri = Uri.http(companiesUrl, companiesPath);
    var response = await client.postUri(
      uri,
      data: {'name': company.name,
             'description': company.description,
             'industry': company.industry}
    );
    if (response.statusCode == 200) {
      return response.data.values.first;
    }
    return 0;
  }

  @override
  Future<int> deleteCompany(int id) async {
    var uri = Uri.http(companiesUrl, '$companiesPath/$id');
    var response = await client.deleteUri(uri);
    if (response.statusCode == 200) {
      return response.data.values.first;
    }
    return 0;
  }
}