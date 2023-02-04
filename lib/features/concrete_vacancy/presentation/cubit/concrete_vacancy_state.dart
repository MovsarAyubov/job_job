// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/detailed_vacancy.dart';

abstract class ConcreteVacancyState extends Equatable {
  const ConcreteVacancyState();

  @override
  List<Object> get props => [];
}

class ConcreteVacancyInitial extends ConcreteVacancyState {}

class ConcreteVacancyLoadedState extends ConcreteVacancyState {
  final DetailedVacancyEntity concreteVacancy;
  const ConcreteVacancyLoadedState({
    required this.concreteVacancy,
  });
  @override
  List<Object> get props => [concreteVacancy];
}

class ErrorState extends ConcreteVacancyState {
  final String errorMessage;
  const ErrorState({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}
