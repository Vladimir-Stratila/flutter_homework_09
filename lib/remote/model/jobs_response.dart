class JobsResponse {
  JobsResponse({
    required this.result,
  });
  late final List<Result> result;

  JobsResponse.fromJson(Map<String, dynamic> json){
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
    required this.companyId,
    required this.title,
    required this.description,
    required this.city,
  });
  late final int id;
  late final int companyId;
  late final String title;
  late final String description;
  late final String city;

  Result.fromJson(Map<String, dynamic> json){
    id = json['id'];
    companyId = json['companyId'];
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    city = json['city'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['companyId'] = companyId;
    data['title'] = title;
    data['description'] = description;
    data['city'] = city;
    return data;
  }
}