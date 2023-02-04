// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/entities/detailed_vacancy.dart';
import 'package:poisk_raboty/features/concrete_vacancy/domain/repositories/concrete_vacancy_repository.dart';

import '../../../../core/exceptions/failure.dart';

@LazySingleton()
class FetchDetailedVacancy {
  final ConcreteVacancyRepository repository;
  const FetchDetailedVacancy({
    required this.repository,
  });

  Future<Either<Failure, DetailedVacancyEntity>> call({required String url}) {
    return repository.fetchConcreteVacancy(url: url);
  }
}
