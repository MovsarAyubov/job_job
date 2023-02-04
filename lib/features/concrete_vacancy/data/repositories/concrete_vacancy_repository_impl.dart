// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/core/exceptions/failure.dart';
import 'package:poisk_raboty/features/concrete_vacancy/data/datasources/detailed_vacancy_source.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/detailed_vacancy.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/repositories/concrete_vacancy_repository.dart';

@LazySingleton(as: ConcreteVacancyRepository)
class ConcreteVacancyRepositoryImpl implements ConcreteVacancyRepository {
  final ConcreteVacancySource source;
  ConcreteVacancyRepositoryImpl({
    required this.source,
  });
  @override
  Future<Either<Failure, DetailedVacancyEntity>> fetchConcreteVacancy(
      {required String url}) async {
    try {
      return Right(await source.fetchConcreteVacancy(url: url));
    } catch (e) {
      return const Left(FailureSimulation());
    }
  }
}
