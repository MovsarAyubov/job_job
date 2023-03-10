// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:poisk_raboty/features/home_page/data/datasources/vacancies_source.dart';
import 'package:poisk_raboty/features/home_page/domain/entities/vacancy_entity.dart';
import 'package:poisk_raboty/features/home_page/domain/repositories/vacancy_repository.dart';

@LazySingleton(as: VacancyRepository)
class VacanciesRepasitoryImpl implements VacancyRepository {
  final VacanciesSource source;
  VacanciesRepasitoryImpl({
    required this.source,
  });

  @override
  Future<Either<Failure, List<VacancyEntity>>> fetchVacancies(
      {required num page,
      required double salary,
      required int area,
      required String job}) async {
    try {
      final listOfVacancies = await source.fetchListOfVacancies(
          page: page, salary: salary, job: job, area: area);
      return Right(listOfVacancies);
    } catch (e) {
      return const Left(FailureSimulation());
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}
