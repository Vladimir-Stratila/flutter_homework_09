import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int id;
  final String name;
  final String description;
  final String industry;

  const Company(this.id, this.name, this.description, this.industry);

  @override
  List<Object?> get props => [id, name, description, industry];

  @override
  bool get stringify => true;
}