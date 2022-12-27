class CompaniesResponse {
  CompaniesResponse({
    required this.result,
  });
  late final List<Result> result;

  CompaniesResponse.fromJson(Map<String, dynamic> json){
    result = List.from(json['result']).map((e)=>Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.description,
    required this.industry,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String industry;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    industry = json['industry'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['industry'] = industry;
    return data;
  }
}