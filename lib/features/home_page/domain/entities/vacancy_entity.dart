import 'package:equatable/equatable.dart';

class VacancyEntity extends Equatable {
  final String title;
  final num salary;

  const VacancyEntity(this.title, this.salary);

  @override
  List<Object?> get props => [title, salary];
}
