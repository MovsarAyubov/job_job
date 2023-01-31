// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class VacancyEntity extends Equatable {
  final String title;
  final String salary;
  final String description;
  final String company;
  final String address;

  const VacancyEntity({
    required this.title,
    required this.salary,
    required this.description,
    required this.company,
    required this.address,
  });

  @override
  List<Object?> get props => [title, salary, description, company, address];
}
