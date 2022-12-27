import 'package:equatable/equatable.dart';

class Job extends Equatable{
  final int id;
  final int companyId;
  final String title;
  final String description;
  final String city;

  const Job(this.id, this.title, this.companyId, this.description, this.city);

  @override
  List<Object?> get props => [id, companyId, title, description, city];

  @override
  bool get stringify => true;
}