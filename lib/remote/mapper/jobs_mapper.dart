import '/data/model/job.dart';
import '/remote/model/jobs_response.dart';

class JobsMapper {

  List<Job> map(List<Result>? data) {
    if (data == null) {
      return [];
    }
    return data.map((e) =>
        Job(e.id, e.title, e.companyId, e.description, e.city ?? '')).toList();
  }
}