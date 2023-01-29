// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../domain/entities/vacancy_entity.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class VacanciesLoadedState extends HomePageState {
  final List<VacancyEntity> vacancies;
  const VacanciesLoadedState({
    this.vacancies = const [],
  });
  @override
  List<Object> get props => [vacancies];
}

class ErrorState extends HomePageState {
  final String errorMessage;
  const ErrorState({
    this.errorMessage = '',
  });
  @override
  List<Object> get props => [errorMessage];
}

class HomeInitital extends HomePageState {}
