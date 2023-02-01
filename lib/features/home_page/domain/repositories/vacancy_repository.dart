import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/vacancy_entity.dart';

abstract class VacancyRepository extends Equatable {
  Future<Either<Failure, List<VacancyEntity>>> fetchVacancies(
      {required num page});
}
