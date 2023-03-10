import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/vacancy_entity.dart';
import '../repositories/vacancy_repository.dart';

@LazySingleton()
class FetchVacancies {
  final VacancyRepository repository;
  const FetchVacancies({
    required this.repository,
  });
  Future<Either<Failure, List<VacancyEntity>>> call(
      {required num page,
      required double salary,
      required int area,
      required String job}) {
    return repository.fetchVacancies(
        page: page, salary: salary, area: area, job: job);
  }
}
