import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/detailed_vacancy.dart';

abstract class ConcreteVacancyRepository {
  Future<Either<Failure, DetailedVacancyEntity>> fetchConcreteVacancy(
      {required String url});
}
